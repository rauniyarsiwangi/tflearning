locals {
  resource_group_name = element(coalescelist(data.azurerm_resource_group.vm.*.name, azurerm_resource_group.vm.*.name, [""]), 0)
  location            = element(coalescelist(data.azurerm_resource_group.vm.*.location, azurerm_resource_group.vm.*.location, [""]), 0)
  # key_vault_secret_ids = [
  #   for cert_key, cert_value in data.azurerm_key_vault_certificate.akv_cert :
  #   trimsuffix(cert_value.secret_id, cert_value.version)
  # ]
}

data "azurerm_resource_group" "vm" {
  count = var.create_resource_group == false ? 1 : 0
  name  = var.resource_group_name
}

resource "azurerm_resource_group" "vm" {
  count    = var.create_resource_group == true ? 1 : 0
  location = var.location
  name     = var.resource_group_name
}

data "azurerm_subnet" "snet" {
  name                 = var.subnet_name
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.vnet_rg_name
}

data "azurerm_public_ip" "pip" {
  name                = var.pip_name
  resource_group_name = local.resource_group_name
}

data "azurerm_key_vault" "akv" {
  # count               = var.enable_https_rule == true ? 1 : 0
  name                = var.kv_name
  resource_group_name = var.kv_rg_name
}

# data "azurerm_key_vault_certificate" "akv_cert" {
#   count        = var.enable_https_rule == true ? 1 : 0
#   name         = var.akv_cert_name
#   key_vault_id = data.azurerm_key_vault.akv.0.id
# }/

data "azurerm_key_vault_certificate" "akv_cert" {
  for_each     = var.ssl_certificate != null ? var.ssl_certificate : {}
  name         = each.value.name
  key_vault_id = data.azurerm_key_vault.akv.id
}


# # Retrieve all SSL certificates from Azure Key Vault
# data "azurerm_key_vault_secret" "ssl_certificates" {
#   count        = length(var.ssl_certificate) > 0 ? length(keys(var.ssl_certificate)) : 0
#   name         = var.akv_cert_name
#   key_vault_id = data.azurerm_key_vault.akv.id
# }

data "azurerm_user_assigned_identity" "example" {
  name                = var.user_assigned_identity
  resource_group_name = local.resource_group_name
}


resource "azurerm_application_gateway" "appgw" {
  name                = var.appgw_name
  resource_group_name = local.resource_group_name
  location            = local.location
  enable_http2        = var.enable_http2
  zones               = var.zones
  ssl_policy {
    # min_protocol_version = "TLSv1_2"
    policy_type = "Predefined"
    policy_name = "AppGwSslPolicy20220101"
  }
  sku {
    name     = var.sku_name
    tier     = var.sku_tier
    capacity = var.sku_capacity
  }
  gateway_ip_configuration {
    name      = var.gateway_ip_configuration_name
    subnet_id = data.azurerm_subnet.snet.id
  }
  dynamic "frontend_port" {
    for_each = var.frontend_ports
    content {
      name = frontend_port.value.name
      port = frontend_port.value.port
    }
  }

  dynamic "frontend_ip_configuration" {
    for_each = var.app_type == "Public" || var.app_type == "Private" ? [1] : []
    content {
      name                 = var.frontend_ip_configuration_name
      public_ip_address_id = data.azurerm_public_ip.pip.id
    }
  }

  dynamic "frontend_ip_configuration" {
    for_each = var.app_type == "Private" ? [1] : []
    content {
      name                          = "${var.frontend_ip_configuration_name}-pvt"
      private_ip_address_allocation = var.app_type == "Private" ? "Static" : null
      private_ip_address            = var.app_type == "Private" ? var.private_ip_address : null
      subnet_id                     = var.app_type == "Private" ? data.azurerm_subnet.snet.id : null
    }
  }

  dynamic "backend_address_pool" {
    for_each = var.backend_address_pools
    content {
      name         = backend_address_pool.value.name
      ip_addresses = backend_address_pool.value.ip_addresses
    }
  }

  dynamic "backend_http_settings" {
    for_each = var.backend_http_settings != null ? { for idx, val in var.backend_http_settings : idx => val } : {}
    content {
      cookie_based_affinity = "Disabled"
      name                  = backend_http_settings.value.name
      port                  = backend_http_settings.value.port
      protocol              = backend_http_settings.value.protocol
      request_timeout       = backend_http_settings.value.request_timeout
      probe_name            = backend_http_settings.value.probe_name
    }
  }

  dynamic "http_listener" {
    for_each = var.listeners != null ? { for idx, val in var.listeners : idx => val } : {}
    content {
      name                           = http_listener.value.name
      frontend_ip_configuration_name = http_listener.value.frontend_ip_configuration_name
      frontend_port_name             = http_listener.value.frontend_port_name
      protocol                       = http_listener.value.protocol
      host_name                      = lookup(http_listener.value, "host_name", null)
      host_names                     = lookup(http_listener.value, "host_names", null)
      ssl_certificate_name           = http_listener.value.ssl_certificate_name
      require_sni                    = http_listener.value.require_sni
    }
  }
  identity {
    type         = "UserAssigned"
    identity_ids = [data.azurerm_user_assigned_identity.example.id]
  }

  dynamic "probe" {
    for_each = var.probes != null ? { for idx, val in var.probes : idx => val } : {}
    content {
      name                                      = probe.value.name
      protocol                                  = probe.value.protocol
      interval                                  = probe.value.interval
      path                                      = probe.value.path
      timeout                                   = probe.value.timeout
      unhealthy_threshold                       = probe.value.unhealthy_threshold
      port                                      = probe.value.port
      pick_host_name_from_backend_http_settings = false
      host                                      = probe.value.hostname
      minimum_servers                           = probe.value.minimum_servers
      match {
        body        = ""
         status_code = split(",", probe.value.status_code)
      }
    }
  }

  dynamic "request_routing_rule" {
    for_each = var.request_routing_rules != null ? { for idx, val in var.request_routing_rules : idx => val } : {}
    content {
      name                        = request_routing_rule.value.name
      rule_type                   = request_routing_rule.value.rule_type
      http_listener_name          = request_routing_rule.value.http_listener_name
      backend_address_pool_name   = request_routing_rule.value.backend_address_pool_name
      backend_http_settings_name  = request_routing_rule.value.backend_http_settings_name
      redirect_configuration_name = request_routing_rule.value.redirect_configuration_name
      priority                    = request_routing_rule.value.priority
      url_path_map_name           = request_routing_rule.value.rule_type == "PathBasedRouting" ? request_routing_rule.value.url_path_map_name : null
    }
  }

  dynamic "url_path_map" {
    for_each = var.url_path_maps != null ? var.url_path_maps : {}

    content {
      name                                = url_path_map.value.name
      default_backend_address_pool_name   = url_path_map.value.default_backend_address_pool_name
      default_backend_http_settings_name  = url_path_map.value.default_backend_http_settings_name
      default_redirect_configuration_name = url_path_map.value.default_redirect_configuration_name

      dynamic "path_rule" {
        for_each = url_path_map.value.path_rule != null ? url_path_map.value.path_rule : {}

        content {
          name                        = path_rule.value.name
          backend_address_pool_name   = path_rule.value.backend_address_pool_name
          backend_http_settings_name  = path_rule.value.backend_http_settings_name
          paths                       = path_rule.value.paths
          redirect_configuration_name = path_rule.value.redirect_configuration_name
        }
      }
    }
  }


  dynamic "redirect_configuration" {
    for_each = var.redirect_configuration != null ? { for idx, val in var.redirect_configuration : idx => val } : {}
    content {
      name                 = redirect_configuration.value.name
      redirect_type        = redirect_configuration.value.redirect_type
      target_listener_name = redirect_configuration.value.target_listener_name
      target_url           = redirect_configuration.value.target_url
      include_path         = redirect_configuration.value.include_path
      include_query_string = redirect_configuration.value.include_query_string
    }
  }

  dynamic "waf_configuration" {
    for_each = var.sku_tier == "WAF" || var.sku_tier == "WAF_v2" ? { for idx, val in var.waf_config : idx => val } : {}
    content {
      enabled          = waf_config.value.enabled
      firewall_mode    = waf_config.value.firewall_mode
      rule_set_type    = waf_config.value.rule_set_type
      rule_set_version = waf_config.value.rule_set_version

    }
  }

  # dynamic "ssl_certificate" {
  #   for_each = var.ssl_certificate != null ? var.ssl_certificate : {}
  #   content {
  #     name = ssl_certificate.value.name

  #     # Ensure that key_vault_secret_id is always specified for each SSL certificate
  #     key_vault_secret_id = tostring(trimsuffix(data.azurerm_key_vault_certificate.akv_cert.0.secret_id, "${data.azurerm_key_vault_certificate.akv_cert.0.version}"))


  #   }
  # }

  dynamic "ssl_certificate" {
    for_each = var.ssl_certificate != null ? var.ssl_certificate : {}
    content {
      name = ssl_certificate.value.name

      # Ensure that key_vault_secret_id is always specified for each SSL certificate
      # key_vault_secret_id = join(",", [
      #   for cert in local.key_vault_secret_ids :
      #   "${cert.version}"
      # ])
      key_vault_secret_id = ssl_certificate.value.secret_id
    }
  }


  lifecycle {
    ignore_changes = [zones, waf_configuration, frontend_port, tags, frontend_ip_configuration, gateway_ip_configuration, ssl_policy, autoscale_configuration, rewrite_rule_set, enable_http2, ssl_certificate]
  }
}
