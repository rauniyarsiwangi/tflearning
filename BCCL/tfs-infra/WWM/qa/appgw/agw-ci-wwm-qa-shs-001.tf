module "agw-ci-wwm-qa-shs-001" {
  source                        = "../../../../tfs-modules/azurerm_application_gateway"
  create_resource_group         = false
  resource_group_name           = "rsg-ci-wwm-qa-shs-01"
  location                      = "central india"
  subnet_name                   = "snt-ci-wwm-qa-appgw-01"
  virtual_network_name          = "vnet-ci-wwm-qa-net-01"
  vnet_rg_name                  = "rsg-ci-wwm-qa-net-01"
  pip_name                      = "pip-ci-wwm-qa-shs-001"
  appgw_name                    = "agw-ci-wwm-qa-shs-001"
  sku_name                      = "Standard_v2"
  sku_tier                      = "Standard_v2"
  sku_capacity                  = "1"
  app_type                      = "Public"
  enable_http2                  = true
  gateway_ip_configuration_name = "agw-gateway-config-01"
  user_assigned_identity        = "mi-ci-wwm-qa-shs-01"
  enable_https_rule             = false
  # kv_name                       = "kv-ci-wwm-qa-shs-01"
  # kv_rg_name                    = "rsg-ci-wwm-qa-shs-01"
  # akv_cert_name                 = "Timesprism-com-01"
  zones = ["1", "2", "3"]
  # private_ip_address            = "10.11.23.254"
  frontend_ports = {
    "fp1" = {
      name = "http-frontend"
      port = "80"
    },
  }
  frontend_ip_configuration_name = "agw-frontend-config-01"
  backend_address_pools = {
    "bpool" = {
      name = "agw-bppol1"
    }
  }
  request_routing_rules = {
    "rrule1" = {
      name                       = "agw-routing-rule-01"
      rule_type                  = "Basic"
      http_listener_name         = "agw-http-listner-01"
      backend_address_pool_name  = "agw-bppol1"
      priority                   = 10
      backend_http_settings_name = "agw-backend-setting-01"
    }
  }
  listeners = {
    "http1" = {
      name                           = "agw-http-listner-01"
      frontend_ip_configuration_name = "agw-frontend-config-01"
      frontend_port_name             = "http-frontend"
      protocol                       = "Http"
    }
  }
  backend_http_settings = {
    "bstng1" = {
      name     = "agw-backend-setting-01"
      port     = 80
      protocol = "Http"
    }
  }

  # ssl_certificate = {
  #   "ssl1" = {
  #     name = "Timesprism-com-01"
  #   }
  # }

}

