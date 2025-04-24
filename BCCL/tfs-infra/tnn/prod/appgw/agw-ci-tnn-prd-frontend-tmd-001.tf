module "agw-ci-tnn-prd-frontend-tmd-001" {
  source                        = "../../../../tfs-modules/azurerm_application_gateway"
  create_resource_group         = false
  resource_group_name           = "rsg-ci-tnn-prd-shs-01"
  location                      = "central india"
  subnet_name                   = "snt-ci-tnn-prd-appgw-01"
  virtual_network_name          = "vnet-ci-tnn-prd-net-01"
  vnet_rg_name                  = "rsg-ci-tnn-prd-net-01"
  pip_name                      = "pip-ci-tnn-prd-appgw-02"
  appgw_name                    = "agw-ci-tnn-prd-frontend-tmd-001"
  sku_name                      = "Standard_v2"
  sku_tier                      = "Standard_v2"
  sku_capacity                  = "1"
  app_type                      = "Public"
  enable_http2                  = true
  gateway_ip_configuration_name = "agw-gateway-config-01"
  kv_name                       = "kv-ci-tnn-prd-shs-01"
  kv_rg_name                    = "rsg-ci-tnn-prd-shs-01"
  zones                         = ["1", "2", "3"]
  private_ip_address            = "10.13.17.253"
  user_assigned_identity        = "mi-ci-tnn-prd-shs-01"
  frontend_ports = {
    "fp1" = {
      name = "https-frontend"
      port = "443"
    },
    "fp2" = {
      name = "http-frontend"
      port = "80"
    },
  }

  backend_http_settings = {
    "bstng1" = {
      name       = "tmd-backend-setting-01"
      port       = 80
      protocol   = "Http"
      probe_name = "tmd-health-probe-01"
    }
  }
  frontend_ip_configuration_name = "agw-frontend-config-01"
  backend_address_pools = {
    "bpool" = {
      name         = "tmd-bpool1"
      ip_addresses = ["10.13.0.8", "10.13.0.9"]
    }
  }
  request_routing_rules = {
    "rrule1" = {
      name                       = "tmd-routing-rule-01"
      rule_type                  = "Basic"
      http_listener_name         = "tmd-https-listener-01"
      backend_address_pool_name  = "tmd-bpool1"
      priority                   = 100
      backend_http_settings_name = "tmd-backend-setting-01"
    },
    "rrule2" = {
      name                        = "tmd-routing-rule-02"
      rule_type                   = "Basic"
      http_listener_name          = "tmd-http-listener-01"
      # backend_address_pool_name   = "tmd-bpool1"
      priority                    = 110
      # backend_http_settings_name  = "tmd-backend-setting-01"
      redirect_configuration_name = "tmd-redirection-01"
    },
  }
  listeners = {
    "http1" = {
      name                           = "tmd-https-listener-01"
      frontend_ip_configuration_name = "agw-frontend-config-01"
      frontend_port_name             = "https-frontend"
      protocol                       = "Https"
      ssl_certificate_name           = "Timesdrive-in-01"
      host_name                      = "timesdrive.in"
    },
    "http2" = {
      name                           = "tmd-http-listener-01"
      frontend_ip_configuration_name = "agw-frontend-config-01"
      frontend_port_name             = "http-frontend"
      protocol                       = "Http"
      host_name                      = "timesdrive.in"
    }
  }

  redirect_configuration = {
    "redirection1" = {
      name                 = "tmd-redirection-01"
      redirect_type        = "Permanent"
      target_listener_name = "tmd-https-listener-01"
      include_path         = true
      include_query_string = true
    },
  }

  probes = {
    "probe1" = {
      name                                      = "tmd-health-probe-01"
      protocol                                  = "Http"
      interval                                  = 30
      timeout                                   = 30
      unhealthy_threshold                       = 3
      pick_host_name_from_backend_http_settings = false
      hostname                                  = "timesdrive.in"
      path                                      = "/"
    }
  }

  ssl_certificate = {
    "ssl1" = {
      name      = "Timesdrive-in-01"
      secret_id = "https://kv-ci-tnn-prd-shs-01.vault.azure.net/secrets/Timesdrive-in-01"
    }
  }

}



