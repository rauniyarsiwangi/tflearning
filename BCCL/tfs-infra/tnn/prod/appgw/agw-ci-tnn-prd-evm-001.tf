
module "agw-ci-tnn-prd-evm-001" {
  source                        = "../../../../tfs-modules/azurerm_application_gateway"
  create_resource_group         = false
  resource_group_name           = "rsg-ci-tnn-prd-evm-app-01"
  location                      = "central india"
  subnet_name                   = "snt-ci-tnn-prd-appgw-01"
  virtual_network_name          = "vnet-ci-tnn-prd-net-01"
  vnet_rg_name                  = "rsg-ci-tnn-prd-net-01"
  pip_name                      = "pip-ci-tnn-prd-shs-001"
  appgw_name                    = "agw-ci-tnn-prd-evm-001"
  sku_name                      = "Standard_v2"
  sku_tier                      = "Standard_v2"
  sku_capacity                  = "1"
  app_type                      = "Public"
  enable_http2                  = true
  gateway_ip_configuration_name = "agw-gateway-config-01"
  kv_name                       = "kv-ci-tnn-prd-shs-01"
  kv_rg_name                    = "rsg-ci-tnn-prd-shs-01"
  akv_cert_name                 = "Eventaccess-in-01"
  zones                         = ["1"]
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
  frontend_ip_configuration_name = "agw-frontend-config-01"
  backend_address_pools = {
    "bpool" = {
      name         = "agw-bpool1"
      ip_addresses = null
    }
  }
  request_routing_rules = {
    "rrule1" = {
      name                       = "agw-routing-rule-01"
      rule_type                  = "Basic"
      http_listener_name         = "agw-https-listener-01"
      backend_address_pool_name  = "agw-bpool1"
      priority                   = 100
      backend_http_settings_name = "agw-backend-setting-01"
    },
    "rrule2" = {
      name                       = "agw-routing-rule-02"
      rule_type                  = "Basic"
      http_listener_name         = "agw-http-listener-01"
      backend_address_pool_name  = "agw-bpool1"
      priority                   = 110
      backend_http_settings_name = "agw-backend-setting-01"
    },
  }
  listeners = {
    "http1" = {
      name                           = "agw-https-listener-01"
      frontend_ip_configuration_name = "agw-frontend-config-01"
      frontend_port_name             = "https-frontend"
      protocol                       = "Https"
      ssl_certificate_name           = "Eventaccess-in-01"
    },
    "http2" = {
      name                           = "agw-http-listener-01"
      frontend_ip_configuration_name = "agw-frontend-config-01"
      frontend_port_name             = "http-frontend"
      protocol                       = "Http"
    }
  }

  probes = {
    "probe1" = {
      name                                      = "agw-health-probe-01"
      protocol                                  = "Http"
      interval                                  = 30
      timeout                                   = 30
      unhealthy_threshold                       = 3
      pick_host_name_from_backend_http_settings = false
      hostname                                  = "eventaccess.in"
      path                                      = "/"
    }
  }
  backend_http_settings = {
    "bstng1" = {
      name       = "agw-backend-setting-01"
      port       = 80
      protocol   = "Http"
      probe_name = "agw-health-probe-01"
    }
  }

  ssl_certificate = {
    "ssl1" = {
      name = "Eventaccess-in-01"
    }
  }
}



