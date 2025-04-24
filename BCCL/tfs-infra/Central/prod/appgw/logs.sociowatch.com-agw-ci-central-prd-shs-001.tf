module "sw-agw-ci-central-prd-shs-004" {
  source                        = "../../../../tfs-modules/azurerm_application_gateway"
  create_resource_group         = false
  resource_group_name           = "rsg-ci-central-prd-shs-001"
  location                      = "central india"
  subnet_name                   = "snt-ci-central-prd-appgw-01"
  virtual_network_name          = "vnet-ci-central-prd-net-01"
  vnet_rg_name                  = "rsg-ci-central-prd-net-01"
  pip_name                      = "pip-ci-central-prd-shs-006"
  appgw_name                    = "logs.sociowatch.com-agw-ci-central-prd-shs-001"
  sku_name                      = "Standard_v2"
  sku_tier                      = "Standard_v2"
  sku_capacity                  = "1"
  app_type                      = "Public"
  enable_http2                  = true
  gateway_ip_configuration_name = "agw-gateway-config-01"
  kv_name                       = "kv-ci-central-prd-shs-01"
  kv_rg_name                    = "rsg-ci-central-prd-shs-01"
  #   akv_cert_name                 = "Timesprism-com-01"
  zones              = ["1", "2", "3"]
  private_ip_address = "10.11.23.254"
  frontend_ports = {
    "fp1" = {
      name = "https-frontend"
      port = "443"
    },
  }
  frontend_ip_configuration_name = "agw-frontend-config-01"
  backend_address_pools = {
    "bpool" = {
      name         = "agw-bppol1"
      ip_addresses = ["10.11.0.5"]
    }
  }
  request_routing_rules = {
    "rrule73" = {
      name                       = "agw-routing-rule-01"
      rule_type                  = "Basic"
      http_listener_name         = "agw-https-listener-01"
      backend_address_pool_name  = "agw-bppol1"
      priority                   = 100
      backend_http_settings_name = "agw-backend-setting-01"
    },
    "rrule74" = {
      name                        = "agw-routing-rule-02"
      rule_type                   = "Basic"
      http_listener_name          = "agw-http-listener-01"
      priority                    = 110
      redirect_configuration_name = "agw-redirection-01"
    },

  }
  listeners = {
    "http1" = {
      name                           = "agw-https-listner-01"
      frontend_port_name             = "https-frontend"
      protocol                       = "Https"
      ssl_certificate_name           = "Sociowatch-com-01"
      frontend_ip_configuration_name = "agw-frontend-config-01"
      host_name                      = "logs.sociowatch.com"
    },
    "http2" = {
      name                           = "agw-http-listner-01"
      frontend_port_name             = "http-frontend"
      protocol                       = "Http"
      frontend_ip_configuration_name = "agw-frontend-config-01"
      host_name                      = "logs.sociowatch.com"
    },
  }
  backend_http_settings = {
    "bstng1" = {
      name     = "agw-backend-setting-01"
      port     = 80
      protocol = "Http"
    }
  }

  redirect_configuration = {
    "redirection41" = {
      name                 = "agw-redirection-01"
      redirect_type        = "Permanent"
      target_listener_name = "agw-https-listener-01"
      include_path         = true
      include_query_string = true
    },
  }

  probes = {
    "probe1" = {
      name                                      = "agw-health-probe-01"
      protocol                                  = "Http"
      interval                                  = 30
      timeout                                   = 30
      unhealthy_threshold                       = 3
      pick_host_name_from_backend_http_settings = false
      hostname                                  = "logs.sociowatch.com"
      path                                      = "/"
      status_code                               = "200-399"
    },
  }

  ssl_certificate = {
    "ssl1" = {
      name      = "Sociowatch-com-01"
      secret_id = "https://kv-ci-central-prd-shs-01.vault.azure.net/secrets/Sociowatch-com-01"
    },
  }

}

