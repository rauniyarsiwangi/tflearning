module "agw-ci-central-prd-shs-001" {
  source                        = "../../../../tfs-modules/azurerm_application_gateway"
  create_resource_group         = false
  resource_group_name           = "rsg-ci-central-prd-shs-001"
  location                      = "central india"
  subnet_name                   = "snt-ci-central-prd-appgw-01"
  virtual_network_name          = "vnet-ci-central-prd-net-01"
  vnet_rg_name                  = "rsg-ci-central-prd-net-01"
  pip_name                      = "pip-ci-central-prd-prism-appgw-001"
  appgw_name                    = "agw-ci-central-prd-shs-001"
  sku_name                      = "Standard_v2"
  sku_tier                      = "Standard_v2"
  sku_capacity                  = "2"
  app_type                      = "Private"
  enable_http2                  = true
  gateway_ip_configuration_name = "agw-gateway-config-01"
  kv_name                       = "kv-ci-central-prd-shs-01"
  kv_rg_name                    = "rsg-ci-central-prd-shs-01"
  # akv_cert_name                 = "Timesprism-com-01"
  user_assigned_identity = "mi-ci-central-prd-shs-01"
  zones                  = ["1", "2", "3"]
  private_ip_address     = "10.11.23.243"
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
  backend_address_pools = {
    "bpool1" = {
      name         = "epitome-bpool1"
      ip_addresses = ["10.11.0.112", "10.11.0.113"]
    },
    "bpool2" = {
      name         = "bnews-bpool1"
      ip_addresses = ["10.11.0.56"]
    },
    "bpool3" = {
      name         = "vspstatic-bpool1"
      ip_addresses = ["10.11.9.44", "10.11.9.45"]
    },
    "bpool4" = {
      name         = "cachemanager-bpool1"
      ip_addresses = ["10.11.0.98"]
    },
    "bpool5" = {
      name         = "cachemaster-bpool1"
      ip_addresses = ["10.11.0.92"]
    },
    "bpool6" = {
      name         = "vault-bpool1"
      ip_addresses = ["10.11.0.128"]
    },
    "bpool7" = {
      name         = "mobile-bpool1"
      ip_addresses = ["10.11.0.133"]
    },
    "bpool8" = {
      name         = "cmsanalytics-bpool1"
      ip_addresses = ["10.11.0.110"]
    },
    "bpool9" = {
      name         = "cmsgraph-bpool1"
      ip_addresses = ["10.11.0.26", "10.11.0.27"]
    },
    "bpool10" = {
      name         = "cmsjsso-bpool1"
      ip_addresses = ["10.11.0.53"]
    },
    "bpool11" = {
      name         = "cmssolrservices-bpool1"
      ip_addresses = ["10.11.8.173"]
    },
    "bpool12" = {
      name         = "commentmoderator-bpool1"
      ip_addresses = ["10.11.0.126"]
    },
    "bpool13" = {
      name         = "manage-bpool1"
      ip_addresses = ["10.11.0.73"]
    },
    "bpool14" = {
      name         = "dam-bpool1"
      ip_addresses = ["10.11.0.75", "10.11.0.76"]
    },
    "bpool15" = {
      name         = "craft-bpool1"
      ip_addresses = ["10.11.0.20"]
    },
    "bpool16" = {
      name         = "evolveai-bpool1"
      ip_addresses = ["10.11.0.18", "10.11.0.19"]
    },
    "bpool17" = {
      name         = "indweller-bpool1"
      ip_addresses = ["10.11.0.35"]
    },
    "bpool18" = {
      name         = "sso-bpool1"
      ip_addresses = ["10.11.0.47"]
    },
    "bpool19" = {
      name         = "medley-bpool1"
      ip_addresses = ["10.11.0.118"]
    },
    "bpool20" = {
      name         = "mra-bpool1"
      ip_addresses = ["10.11.0.164"]
    },
    "bpool21" = {
      name         = "myt-bpool1"
      ip_addresses = ["10.11.0.120"]
    },
    "bpool22" = {
      name         = "orion-bpool1"
      ip_addresses = ["10.11.0.87"]
    },
    "bpool23" = {
      name         = "socialappsintegrator-bpool1"
      ip_addresses = ["10.11.0.51"]
    },
    "bpool24" = {
      name         = "solrapps-bpool1"
      ip_addresses = ["10.11.0.81"]
    },
    "bpool25" = {
      name         = "minio-bpool1"
      ip_addresses = ["10.11.0.160", "10.11.0.161"]
    },
    "bpool26" = {
      name         = "jcmssolr-bpool1"
      ip_addresses = ["10.11.0.104"]
    },
    "bpool27" = {
      name         = "services-orion-bpool1"
      ip_addresses = ["10.11.0.89"]
    },
    "bpool28" = {
      name         = "solrdenmark-bpool1"
      ip_addresses = ["10.11.8.145"]
    },
    # "bpool29" = {
    #   name         = "tenant-security-bpool1"
    #   ip_addresses = ["10.11.0.36"]
    # },
    "bpool30" = {
      name         = "scribbler-bpool1"
      ip_addresses = ["10.11.0.170", "10.11.0.171"]
    },
    "bpool31" = {
      name         = "stories-bpool1"
      ip_addresses = ["10.11.0.166"]
    },
    "bpool32" = {
      name         = "cloudservices-bpool1"
      ip_addresses = ["10.11.0.58", "10.11.0.59", "10.11.0.60", "10.11.0.61", "10.11.0.62"]
    },
    "bpool33" = {
      name         = "cloudservices-cms-api-bpool1"
      ip_addresses = ["10.11.0.58"]
    },
    "bpool34" = {
      name         = "cloudservices-cms-analytics-bpool1"
      ip_addresses = ["10.11.0.59"]
    },
    "bpool35" = {
      name         = "cloudservices-cms-ext-bpool1"
      ip_addresses = ["10.11.0.60"]
    },
    "bpool36" = {
      name         = "cloudservices-cms-search-bpool1"
      ip_addresses = ["10.11.0.61"]
    },
    "bpool37" = {
      name         = "cloudservices-cms-gn-bpool1"
      ip_addresses = ["10.11.0.62"]
    },
    "bpool38" = {
      name         = "assets-sociowatch-bpool1"
      ip_addresses = ["10.11.0.7"]
    },
    "bpool39" = {
      name         = "cms-sociowatch-bpool1"
      ip_addresses = ["10.11.0.17"]
    },
    "bpool40" = {
      name         = "logs-sociowatch-bpool1"
      ip_addresses = ["10.11.0.5"]
    },
    "bpool41" = {
      name         = "stgcms-sociowatch-bpool1"
      ip_addresses = ["10.11.0.6"]
    },
    "bpool42" = {
      name         = "ws-sociowatch-bpool1"
      ip_addresses = ["10.11.0.13"]
    },
    "bpool43" = {
      name         = "artifacts-timesprism-bpool1"
      ip_addresses = ["10.10.1.20"]
    },
    "bpool44" = {
      name         = "mediahub-timesprism-bpool1"
      ip_addresses = ["10.11.0.183", "10.11.0.184"]
    },
    # "bpool45" = {
    #   name         = "mediahubpvt-timesprism-bpool1"
    #   ip_addresses = ["10.11.0.183", "10.11.0.184"]
    # },
  }

  backend_http_settings = {
    "bstng1" = {
      name       = "epitome-backend-setting-01"
      port       = 80
      protocol   = "Http"
      probe_name = "epitome-health-probe-01"
    },
    "bstng2" = {
      name       = "bnews-backend-setting-01"
      port       = 80
      protocol   = "Http"
      probe_name = "bnews-health-probe-01"
    },
    "bstng3" = {
      name       = "vspstatic-backend-setting-01"
      port       = 80
      protocol   = "Http"
      probe_name = "vspstatic-health-probe-01"
    },
    "bstng4" = {
      name       = "cachemanager-backend-setting-01"
      port       = 80
      protocol   = "Http"
      probe_name = "cachemanager-health-probe-01"
    },
    "bstng5" = {
      name       = "cachemaster-backend-setting-01"
      port       = 80
      protocol   = "Http"
      probe_name = "cachemaster-health-probe-01"
    },
    "bstng6" = {
      name       = "vault-backend-setting-01"
      port       = 80
      protocol   = "Http"
      probe_name = "vault-health-probe-01"
    },
    "bstng7" = {
      name       = "mobile-backend-setting-01"
      port       = 80
      protocol   = "Http"
      probe_name = "mobile-health-probe-01"
    },
    "bstng8" = {
      name       = "cmsanalytics-backend-setting-01"
      port       = 80
      protocol   = "Http"
      probe_name = "cmsanalytics-health-probe-01"
    },
    "bstng9" = {
      name       = "cmsgraph-backend-setting-01"
      port       = 80
      protocol   = "Http"
      probe_name = "cmsgraph-health-probe-01"
    },
    "bstng10" = {
      name       = "cmsjsso-backend-setting-01"
      port       = 8080
      protocol   = "Http"
      probe_name = "cmsjsso-health-probe-01"
    },
    "bstng11" = {
      name       = "cmssolrservices-backend-setting-01"
      port       = 80
      protocol   = "Http"
      probe_name = "cmssolrservices-health-probe-01"
    },
    "bstng12" = {
      name       = "commentmoderator-backend-setting-01"
      port       = 80
      protocol   = "Http"
      probe_name = "commentmoderator-health-probe-01"
    },
    "bstng13" = {
      name       = "manage-backend-setting-01"
      port       = 443
      protocol   = "Https"
      probe_name = "manage-health-probe-01"
    },
    "bstng14" = {
      name       = "dam-backend-setting-01"
      port       = 8080
      protocol   = "Http"
      probe_name = "dam-health-probe-01"
    },
    "bstng15" = {
      name       = "craft-backend-setting-01"
      port       = 443
      protocol   = "Https"
      probe_name = "craft-health-probe-01"
    },
    "bstng16" = {
      name       = "evolveai-backend-setting-01"
      port       = 80
      protocol   = "Http"
      probe_name = "evolveai-health-probe-01"
    },
    "bstng17" = {
      name       = "indweller-backend-setting-01"
      port       = 80
      protocol   = "Http"
      probe_name = "indweller-health-probe-01"
    },
    "bstng18" = {
      name       = "sso-backend-setting-01"
      port       = 80
      protocol   = "Http"
      probe_name = "sso-health-probe-01"
    },
    "bstng19" = {
      name       = "medley-backend-setting-01"
      port       = 8080
      protocol   = "Http"
      probe_name = "medley-health-probe-01"
    },
    "bstng20" = {
      name       = "mra-backend-setting-01"
      port       = 80
      protocol   = "Http"
      probe_name = "mra-health-probe-01"
    },
    "bstng21" = {
      name       = "myt-backend-setting-01"
      port       = 80
      protocol   = "Http"
      probe_name = "myt-health-probe-01"
    },
    "bstng22" = {
      name       = "orion-backend-setting-01"
      port       = 80
      protocol   = "Http"
      probe_name = "orion-health-probe-01"
    },
    "bstng23" = {
      name       = "socialappsintegrator-backend-setting-01"
      port       = 80
      protocol   = "Http"
      probe_name = "socialappsintegrator-health-probe-01"
    },
    "bstng24" = {
      name       = "solrapps-backend-setting-01"
      port       = 80
      protocol   = "Http"
      probe_name = "solrapps-health-probe-01"
    },
    "bstng25" = {
      name       = "minio-backend-setting-01"
      port       = 443
      protocol   = "Https"
      probe_name = "minio-health-probe-01"
    },
    "bstng26" = {
      name       = "console-minio-backend-setting-01"
      port       = 443
      protocol   = "Https"
      probe_name = "console-minio-health-probe-01"
    },
    "bstng27" = {
      name       = "jcmssolr-backend-setting-01"
      port       = 80
      protocol   = "Http"
      probe_name = "jcmssolr-health-probe-01"
    },
    "bstng28" = {
      name       = "services-orion-backend-setting-01"
      port       = 80
      protocol   = "Http"
      probe_name = "services-orion-health-probe-01"
    },
    "bstng29" = {
      name       = "solrdenmark-backend-setting-01"
      port       = 80
      protocol   = "Http"
      probe_name = "solrdenmark-health-probe-01"
    },
    "bstng31" = {
      name       = "scribbler-backend-setting-01"
      port       = 80
      protocol   = "Http"
      probe_name = "scribbler-health-probe-01"
    },
    "bstng32" = {
      name       = "stories-backend-setting-01"
      port       = 3001
      protocol   = "Http"
      probe_name = "stories-health-probe-01"
    },
    "bstng33" = {
      name       = "cloudservices-backend-setting-01"
      port       = 80
      protocol   = "Http"
      probe_name = "cloudservices-health-probe-01"
    },
    "bstng34" = {
      name       = "cloudservices-cms-api-backend-setting-01"
      port       = 80
      protocol   = "Http"
      probe_name = "cloudservices-cms-api-health-probe-01"
    },
    "bstng35" = {
      name       = "cloudservices-cms-analytics-backend-setting-01"
      port       = 80
      protocol   = "Http"
      probe_name = "cloudservices-cms-analytics-health-probe-01"
    },
    "bstng36" = {
      name       = "cloudservices-cms-ext-backend-setting-01"
      port       = 80
      protocol   = "Http"
      probe_name = "cloudservices-cms-ext-health-probe-01"
    },
    "bstng37" = {
      name       = "cloudservices-cms-search-backend-setting-01"
      port       = 80
      protocol   = "Http"
      probe_name = "cloudservices-cms-search-health-probe-01"
    },
    "bstng38" = {
      name       = "cloudservices-cms-gn-backend-setting-01"
      port       = 80
      protocol   = "Http"
      probe_name = "cloudservices-cms-gn-health-probe-01"
    },
    "bstng39" = {
      name       = "assets-sociowatch-backend-setting-01"
      port       = 80
      protocol   = "Http"
      probe_name = "assets-sociowatch-health-probe-01"
    },
    "bstng41" = {
      name       = "cms-sociowatch-backend-setting-02"
      port       = 80
      protocol   = "Http"
      probe_name = "cms-sociowatch-health-probe-02"
    },
    "bstng42" = {
      name       = "logs-sociowatch-backend-setting-01"
      port       = 80
      protocol   = "Http"
      probe_name = "logs-sociowatch-health-probe-01"
    },
    "bstng43" = {
      name       = "stgcms-sociowatch-backend-setting-01"
      port       = 80
      protocol   = "Http"
      probe_name = "stgcms-sociowatch-health-probe-01"
    },
    "bstng44" = {
      name       = "ws-sociowatch-backend-setting-01"
      port       = 80
      protocol   = "Http"
      probe_name = "ws-sociowatch-health-probe-01"
    },
    "bstng45" = {
      name       = "services-sociowatch-backend-setting-01"
      port       = 8080
      protocol   = "Http"
      probe_name = "services-sociowatch-health-probe-01"
    },
    "bstng46" = {
      name       = "artifacts-timesprism-backend-setting-01"
      port       = 8082
      protocol   = "Http"
      probe_name = "artifacts-timesprism-health-probe-01"
    },
    "bstng47" = {
      name       = "monitor-sociowatch-backend-setting-01"
      port       = 8081
      protocol   = "Http"
      probe_name = "monitor-sociowatch-health-probe-01"
    },
    "bstng48" = {
      name       = "mediahub-timesprism-backend-setting-01"
      port       = 80
      protocol   = "Http"
      probe_name = "mediahub-timesprism-health-probe-01"
    },
    "bstng49" = {
      name       = "mediahubpvt-timesprism-backend-setting-01"
      port       = 80
      protocol   = "Http"
      probe_name = "mediahubpvt-timesprism-health-probe-01"
    },
  }
  frontend_ip_configuration_name = "agw-frontend-config-01"
  listeners = {
    "http1" = {
      name                           = "epitome-https-listener-01"
      frontend_port_name             = "https-frontend"
      protocol                       = "Https"
      ssl_certificate_name           = "Timesprism-com-01"
      frontend_ip_configuration_name = "agw-frontend-config-01-pvt"
      host_name                      = "epitome.timesprism.com"
    },
    "http2" = {
      name                           = "epitome-http-listener-01"
      frontend_port_name             = "http-frontend"
      protocol                       = "Http"
      frontend_ip_configuration_name = "agw-frontend-config-01-pvt"
      host_name                      = "epitome.timesprism.com"
    },
    "http3" = {
      name                           = "bnews-https-listener-01"
      frontend_port_name             = "https-frontend"
      protocol                       = "Https"
      ssl_certificate_name           = "Timesprism-com-01"
      frontend_ip_configuration_name = "agw-frontend-config-01-pvt"
      host_name                      = "bnews.timesprism.com"
    },
    "http4" = {
      name                           = "bnews-http-listener-01"
      frontend_port_name             = "http-frontend"
      protocol                       = "Http"
      frontend_ip_configuration_name = "agw-frontend-config-01-pvt"
      host_name                      = "bnews.timesprism.com"
    },
    "http5" = {
      name                           = "vspstatic-https-listener-01"
      frontend_port_name             = "https-frontend"
      protocol                       = "Https"
      ssl_certificate_name           = "Timesprism-com-01"
      frontend_ip_configuration_name = "agw-frontend-config-01"
      host_names                     = ["static.timesprism.com", "vspstatic.timesprism.com"]
    },
    "http6" = {
      name                           = "vspstatic-http-listener-01"
      frontend_port_name             = "http-frontend"
      protocol                       = "Http"
      frontend_ip_configuration_name = "agw-frontend-config-01"
      host_names                     = ["static.timesprism.com", "vspstatic.timesprism.com"]
    },
    "http7" = {
      name                           = "cachemanager-https-listener-01"
      frontend_port_name             = "https-frontend"
      protocol                       = "Https"
      ssl_certificate_name           = "Timesprism-com-01"
      frontend_ip_configuration_name = "agw-frontend-config-01-pvt"
      host_name                      = "cachemanager.timesprism.com"
    },
    "http8" = {
      name                           = "cachemanager-http-listener-01"
      frontend_port_name             = "http-frontend"
      protocol                       = "Http"
      frontend_ip_configuration_name = "agw-frontend-config-01-pvt"
      host_name                      = "cachemanager.timesprism.com"
    },
    "http9" = {
      name                           = "cachemaster-https-listener-01"
      frontend_port_name             = "https-frontend"
      protocol                       = "Https"
      ssl_certificate_name           = "Timesprism-com-01"
      frontend_ip_configuration_name = "agw-frontend-config-01-pvt"
      host_name                      = "cachemaster.timesprism.com"
    },
    "http10" = {
      name                           = "cachemaster-http-listener-01"
      frontend_port_name             = "http-frontend"
      protocol                       = "Http"
      frontend_ip_configuration_name = "agw-frontend-config-01-pvt"
      host_name                      = "cachemaster.timesprism.com"
    },
    "http11" = {
      name                           = "vault-https-listener-01"
      frontend_port_name             = "https-frontend"
      protocol                       = "Https"
      ssl_certificate_name           = "Timesprism-com-01"
      frontend_ip_configuration_name = "agw-frontend-config-01-pvt"
      host_name                      = "vault.timesprism.com"
    },
    "http12" = {
      name                           = "vault-http-listener-01"
      frontend_port_name             = "http-frontend"
      protocol                       = "Http"
      frontend_ip_configuration_name = "agw-frontend-config-01-pvt"
      host_name                      = "vault.timesprism.com"
    },
    "http13" = {
      name                           = "mobile-https-listener-01"
      frontend_port_name             = "https-frontend"
      protocol                       = "Https"
      ssl_certificate_name           = "Timesprism-com-01"
      frontend_ip_configuration_name = "agw-frontend-config-01-pvt"
      host_name                      = "mobile.timesprism.com"
    },
    "http14" = {
      name                           = "mobile-http-listener-01"
      frontend_port_name             = "http-frontend"
      protocol                       = "Http"
      frontend_ip_configuration_name = "agw-frontend-config-01-pvt"
      host_name                      = "mobile.timesprism.com"
    },
    "http15" = {
      name                           = "cmsanalytics-https-listener-01"
      frontend_port_name             = "https-frontend"
      protocol                       = "Https"
      ssl_certificate_name           = "Timesprism-com-01"
      frontend_ip_configuration_name = "agw-frontend-config-01-pvt"
      host_name                      = "cmsanalytics.timesprism.com"
    },
    "http16" = {
      name                           = "cmsanalytics-http-listener-01"
      frontend_port_name             = "http-frontend"
      protocol                       = "Http"
      frontend_ip_configuration_name = "agw-frontend-config-01-pvt"
      host_name                      = "cmsanalytics.timesprism.com"
    },
    "http17" = {
      name                           = "cmsgraph-https-listener-01"
      frontend_port_name             = "https-frontend"
      protocol                       = "Https"
      ssl_certificate_name           = "Timesprism-com-01"
      frontend_ip_configuration_name = "agw-frontend-config-01-pvt"
      host_name                      = "cmsgraph.timesprism.com"
    },
    "http18" = {
      name                           = "cmsgraph-http-listener-01"
      frontend_port_name             = "http-frontend"
      protocol                       = "Http"
      frontend_ip_configuration_name = "agw-frontend-config-01-pvt"
      host_name                      = "cmsgraph.timesprism.com"
    },
    "http19" = {
      name                           = "cmsjsso-https-listener-01"
      frontend_port_name             = "https-frontend"
      protocol                       = "Https"
      ssl_certificate_name           = "Timesprism-com-01"
      frontend_ip_configuration_name = "agw-frontend-config-01-pvt"
      host_name                      = "cmsjsso.timesprism.com"
    },
    "http20" = {
      name                           = "cmsjsso-http-listener-01"
      frontend_port_name             = "http-frontend"
      protocol                       = "Http"
      frontend_ip_configuration_name = "agw-frontend-config-01-pvt"
      host_name                      = "cmsjsso.timesprism.com"
    },
    "http21" = {
      name                           = "cmssolrservices-https-listener-01"
      frontend_port_name             = "https-frontend"
      protocol                       = "Https"
      ssl_certificate_name           = "Timesprism-com-01"
      frontend_ip_configuration_name = "agw-frontend-config-01-pvt"
      host_name                      = "cmssolrservices.timesprism.com"
    },
    "http22" = {
      name                           = "cmssolrservices-http-listener-01"
      frontend_port_name             = "http-frontend"
      protocol                       = "Http"
      frontend_ip_configuration_name = "agw-frontend-config-01-pvt"
      host_name                      = "cmssolrservices.timesprism.com"
    },
    "http23" = {
      name                           = "commentmoderator-https-listener-01"
      frontend_port_name             = "https-frontend"
      protocol                       = "Https"
      ssl_certificate_name           = "Timesprism-com-01"
      frontend_ip_configuration_name = "agw-frontend-config-01-pvt"
      host_name                      = "commentmoderator.timesprism.com"
    },
    "http24" = {
      name                           = "commentmoderator-http-listener-01"
      frontend_port_name             = "http-frontend"
      protocol                       = "Http"
      frontend_ip_configuration_name = "agw-frontend-config-01-pvt"
      host_name                      = "commentmoderator.timesprism.com"
    },
    "http25" = {
      name                           = "manage-https-listener-01"
      frontend_port_name             = "https-frontend"
      protocol                       = "Https"
      ssl_certificate_name           = "Timesprism-com-01"
      frontend_ip_configuration_name = "agw-frontend-config-01-pvt"
      host_name                      = "manage.timesprism.com"
    },
    "http26" = {
      name                           = "manage-http-listener-01"
      frontend_port_name             = "http-frontend"
      protocol                       = "Http"
      frontend_ip_configuration_name = "agw-frontend-config-01-pvt"
      host_name                      = "manage.timesprism.com"
    },
    "http27" = {
      name                           = "dam-https-listener-01"
      frontend_port_name             = "https-frontend"
      protocol                       = "Https"
      ssl_certificate_name           = "Timesprism-com-01"
      frontend_ip_configuration_name = "agw-frontend-config-01-pvt"
      host_name                      = "dam.timesprism.com"
    },
    "http28" = {
      name                           = "dam-http-listener-01"
      frontend_port_name             = "http-frontend"
      protocol                       = "Http"
      frontend_ip_configuration_name = "agw-frontend-config-01-pvt"
      host_name                      = "dam.timesprism.com"
    },
    "http29" = {
      name                           = "craft-https-listener-01"
      frontend_port_name             = "https-frontend"
      protocol                       = "Https"
      ssl_certificate_name           = "Timesprism-com-01"
      frontend_ip_configuration_name = "agw-frontend-config-01-pvt"
      host_name                      = "craft.timesprism.com"
    },
    "http30" = {
      name                           = "craft-http-listener-01"
      frontend_port_name             = "http-frontend"
      protocol                       = "Http"
      frontend_ip_configuration_name = "agw-frontend-config-01-pvt"
      host_name                      = "craft.timesprism.com"
    },
    "http31" = {
      name                           = "evolveai-https-listener-01"
      frontend_port_name             = "https-frontend"
      protocol                       = "Https"
      ssl_certificate_name           = "Timesprism-com-01"
      frontend_ip_configuration_name = "agw-frontend-config-01-pvt"
      host_name                      = "evolveai.timesprism.com"
    },
    "http32" = {
      name                           = "evolveai-http-listener-01"
      frontend_port_name             = "http-frontend"
      protocol                       = "Http"
      frontend_ip_configuration_name = "agw-frontend-config-01-pvt"
      host_name                      = "evolveai.timesprism.com"
    },
    "http33" = {
      name                           = "indweller-https-listener-01"
      frontend_port_name             = "https-frontend"
      protocol                       = "Https"
      ssl_certificate_name           = "Timesprism-com-01"
      frontend_ip_configuration_name = "agw-frontend-config-01-pvt"
      host_name                      = "indweller.timesprism.com"
    },
    "http34" = {
      name                           = "indweller-http-listener-01"
      frontend_port_name             = "http-frontend"
      protocol                       = "Http"
      frontend_ip_configuration_name = "agw-frontend-config-01-pvt"
      host_name                      = "indweller.timesprism.com"
    },
    "http35" = {
      name                           = "sso-https-listener-01"
      frontend_port_name             = "https-frontend"
      protocol                       = "Https"
      ssl_certificate_name           = "Timesprism-com-01"
      frontend_ip_configuration_name = "agw-frontend-config-01"
      host_name                      = "sso.timesprism.com"
    },
    "http36" = {
      name                           = "sso-http-listener-01"
      frontend_port_name             = "http-frontend"
      protocol                       = "Http"
      frontend_ip_configuration_name = "agw-frontend-config-01"
      host_name                      = "sso.timesprism.com"
    },
    "http37" = {
      name                           = "medley-https-listener-01"
      frontend_port_name             = "https-frontend"
      protocol                       = "Https"
      ssl_certificate_name           = "Timesprism-com-01"
      frontend_ip_configuration_name = "agw-frontend-config-01-pvt"
      host_name                      = "medley.timesprism.com"
    },
    "http38" = {
      name                           = "medley-http-listener-01"
      frontend_port_name             = "http-frontend"
      protocol                       = "Http"
      frontend_ip_configuration_name = "agw-frontend-config-01-pvt"
      host_name                      = "medley.timesprism.com"
    },
    "http39" = {
      name                           = "mra-https-listener-01"
      frontend_port_name             = "https-frontend"
      protocol                       = "Https"
      ssl_certificate_name           = "Timesprism-com-01"
      frontend_ip_configuration_name = "agw-frontend-config-01-pvt"
      host_name                      = "mra.timesprism.com"
    },
    "http40" = {
      name                           = "mra-http-listener-01"
      frontend_port_name             = "http-frontend"
      protocol                       = "Http"
      frontend_ip_configuration_name = "agw-frontend-config-01-pvt"
      host_name                      = "mra.timesprism.com"
    },
    "http41" = {
      name                           = "myt-https-listener-01"
      frontend_port_name             = "https-frontend"
      protocol                       = "Https"
      ssl_certificate_name           = "Timesprism-com-01"
      frontend_ip_configuration_name = "agw-frontend-config-01"
      host_name                      = "myt.timesprism.com"
    },
    "http42" = {
      name                           = "myt-http-listener-01"
      frontend_port_name             = "http-frontend"
      protocol                       = "Http"
      frontend_ip_configuration_name = "agw-frontend-config-01"
      host_name                      = "myt.timesprism.com"
    },
    "http43" = {
      name                           = "orion-https-listener-01"
      frontend_port_name             = "https-frontend"
      protocol                       = "Https"
      ssl_certificate_name           = "Timesprism-com-01"
      frontend_ip_configuration_name = "agw-frontend-config-01-pvt"
      host_name                      = "orion.timesprism.com"
    },
    "http44" = {
      name                           = "orion-http-listener-01"
      frontend_port_name             = "http-frontend"
      protocol                       = "Http"
      frontend_ip_configuration_name = "agw-frontend-config-01-pvt"
      host_name                      = "orion.timesprism.com"
    },
    "http45" = {
      name                           = "socialappsintegrator-https-listener-01"
      frontend_port_name             = "https-frontend"
      protocol                       = "Https"
      ssl_certificate_name           = "Timesprism-com-01"
      frontend_ip_configuration_name = "agw-frontend-config-01"
      host_name                      = "socialappsintegrator.timesprism.com"
    },
    "http46" = {
      name                           = "socialappsintegrator-http-listener-01"
      frontend_port_name             = "http-frontend"
      protocol                       = "Http"
      frontend_ip_configuration_name = "agw-frontend-config-01"
      host_name                      = "socialappsintegrator.timesprism.com"
    },
    "http47" = {
      name                           = "solrapps-https-listener-01"
      frontend_port_name             = "https-frontend"
      protocol                       = "Https"
      ssl_certificate_name           = "Timesprism-com-01"
      frontend_ip_configuration_name = "agw-frontend-config-01-pvt"
      host_name                      = "solrapps.timesprism.com"
    },
    "http48" = {
      name                           = "solrapps-http-listener-01"
      frontend_port_name             = "http-frontend"
      protocol                       = "Http"
      frontend_ip_configuration_name = "agw-frontend-config-01-pvt"
      host_name                      = "solrapps.timesprism.com"
    },
    "http49" = {
      name                           = "minio-https-listener-01"
      frontend_port_name             = "https-frontend"
      protocol                       = "Https"
      ssl_certificate_name           = "Timesprism-com-01"
      frontend_ip_configuration_name = "agw-frontend-config-01-pvt"
      host_name                      = "minio.timesprism.com"
    },
    "http50" = {
      name                           = "minio-http-listener-01"
      frontend_port_name             = "http-frontend"
      protocol                       = "Http"
      frontend_ip_configuration_name = "agw-frontend-config-01-pvt"
      host_name                      = "minio.timesprism.com"
    },
    "http51" = {
      name                           = "console-minio-https-listener-01"
      frontend_port_name             = "https-frontend"
      protocol                       = "Https"
      ssl_certificate_name           = "Timesprism-com-01"
      frontend_ip_configuration_name = "agw-frontend-config-01-pvt"
      host_name                      = "console-minio.timesprism.com"
    },
    "http52" = {
      name                           = "console-minio-http-listener-01"
      frontend_port_name             = "http-frontend"
      protocol                       = "Http"
      frontend_ip_configuration_name = "agw-frontend-config-01-pvt"
      host_name                      = "console-minio.timesprism.com"
    },
    "http53" = {
      name                           = "jcmssolr-https-listener-01"
      frontend_port_name             = "https-frontend"
      protocol                       = "Https"
      ssl_certificate_name           = "Timesprism-com-01"
      frontend_ip_configuration_name = "agw-frontend-config-01-pvt"
      host_name                      = "jcmssolr.timesprism.com"
    },
    "http54" = {
      name                           = "jcmssolr-http-listener-01"
      frontend_port_name             = "http-frontend"
      protocol                       = "Http"
      frontend_ip_configuration_name = "agw-frontend-config-01-pvt"
      host_name                      = "jcmssolr.timesprism.com"
    },
    "http55" = {
      name                           = "services-orion-https-listener-01"
      frontend_port_name             = "https-frontend"
      protocol                       = "Https"
      ssl_certificate_name           = "Timesprism-com-01"
      frontend_ip_configuration_name = "agw-frontend-config-01-pvt"
      host_name                      = "services-orion.timesprism.com"
    },
    "http56" = {
      name                           = "services-orion-http-listener-01"
      frontend_port_name             = "http-frontend"
      protocol                       = "Http"
      frontend_ip_configuration_name = "agw-frontend-config-01-pvt"
      host_name                      = "services-orion.timesprism.com"
    },
    "http57" = {
      name                           = "solrdenmark-https-listener-01"
      frontend_port_name             = "https-frontend"
      protocol                       = "Https"
      ssl_certificate_name           = "Timesprism-com-01"
      frontend_ip_configuration_name = "agw-frontend-config-01-pvt"
      host_name                      = "solrdenmark.timesprism.com"
    },
    "http58" = {
      name                           = "solrdenmark-http-listener-01"
      frontend_port_name             = "http-frontend"
      protocol                       = "Http"
      frontend_ip_configuration_name = "agw-frontend-config-01-pvt"
      host_name                      = "solrdenmark.timesprism.com"
    },
    # "http59" = {
    #   name                           = "tenant-security-https-listener-01"
    #   frontend_port_name             = "https-frontend"
    #   protocol                       = "Https"
    #   ssl_certificate_name           = "Timesprism-com-01"
    #   frontend_ip_configuration_name = "agw-frontend-config-01-pvt"
    #   host_name                      = "tenant-security.timesprism.com"
    # },
    # "http60" = {
    #   name                           = "tenant-security-http-listener-01"
    #   frontend_port_name             = "http-frontend"
    #   protocol                       = "Http"
    #   frontend_ip_configuration_name = "agw-frontend-config-01-pvt"
    #   host_name                      = "tenant-security.timesprism.com"
    # },
    "http61" = {
      name                           = "scribbler-https-listener-01"
      frontend_port_name             = "https-frontend"
      protocol                       = "Https"
      ssl_certificate_name           = "Timesprism-com-01"
      frontend_ip_configuration_name = "agw-frontend-config-01-pvt"
      host_name                      = "scribbler.timesprism.com"
    },
    "http62" = {
      name                           = "scribbler-http-listener-01"
      frontend_port_name             = "http-frontend"
      protocol                       = "Http"
      frontend_ip_configuration_name = "agw-frontend-config-01-pvt"
      host_name                      = "scribbler.timesprism.com"
    },
    "http63" = {
      name                           = "stories-https-listener-01"
      frontend_port_name             = "https-frontend"
      protocol                       = "Https"
      ssl_certificate_name           = "Timesprism-com-01"
      frontend_ip_configuration_name = "agw-frontend-config-01"
      host_name                      = "stories.timesprism.com"
    },
    "http64" = {
      name                           = "stories-http-listener-01"
      frontend_port_name             = "http-frontend"
      protocol                       = "Http"
      frontend_ip_configuration_name = "agw-frontend-config-01"
      host_name                      = "stories.timesprism.com"
    },
    "http65" = {
      name                           = "cloudservices-https-listener-01"
      frontend_port_name             = "https-frontend"
      protocol                       = "Https"
      ssl_certificate_name           = "Timesprism-com-01"
      frontend_ip_configuration_name = "agw-frontend-config-01-pvt"
      host_name                      = "cloudservices.timesprism.com"
    },
    "http66" = {
      name                           = "cloudservices-http-listener-01"
      frontend_port_name             = "http-frontend"
      protocol                       = "Http"
      frontend_ip_configuration_name = "agw-frontend-config-01-pvt"
      host_name                      = "cloudservices.timesprism.com"
    },
    "http67" = {
      name                           = "assets-sociowatch-https-listener-01"
      frontend_port_name             = "https-frontend"
      protocol                       = "Https"
      ssl_certificate_name           = "Sociowatch-in-01"
      frontend_ip_configuration_name = "agw-frontend-config-01"
      host_name                      = "assets.sociowatch.in"
    },
    "http68" = {
      name                           = "assets-sociowatch-http-listener-01"
      frontend_port_name             = "http-frontend"
      protocol                       = "Http"
      frontend_ip_configuration_name = "agw-frontend-config-01"
      host_name                      = "assets.sociowatch.in"
    },
    "http71" = {
      name                           = "cms-sociowatch-https-listener-02"
      frontend_port_name             = "https-frontend"
      protocol                       = "Https"
      ssl_certificate_name           = "Sociowatch-in-01"
      frontend_ip_configuration_name = "agw-frontend-config-01-pvt"
      host_name                      = "cms.sociowatch.in"
    },
    "http72" = {
      name                           = "cms-sociowatch-http-listener-02"
      frontend_port_name             = "http-frontend"
      protocol                       = "Http"
      frontend_ip_configuration_name = "agw-frontend-config-01-pvt"
      host_name                      = "cms.sociowatch.in"
    },
    "http73" = {
      name                           = "logs-sociowatch-https-listener-01"
      frontend_port_name             = "https-frontend"
      protocol                       = "Https"
      ssl_certificate_name           = "Sociowatch-com-01"
      frontend_ip_configuration_name = "agw-frontend-config-01"
      host_name                      = "logs.sociowatch.com"
    },
    "http74" = {
      name                           = "logs-sociowatch-http-listener-01"
      frontend_port_name             = "http-frontend"
      protocol                       = "Http"
      frontend_ip_configuration_name = "agw-frontend-config-01"
      host_name                      = "logs.sociowatch.com"
    },
    "http75" = {
      name                           = "stgcms-sociowatch-https-listener-01"
      frontend_port_name             = "https-frontend"
      protocol                       = "Https"
      ssl_certificate_name           = "Sociowatch-in-01"
      frontend_ip_configuration_name = "agw-frontend-config-01-pvt"
      host_name                      = "stgcms.sociowatch.in"
    },
    "http76" = {
      name                           = "stgcms-sociowatch-http-listener-01"
      frontend_port_name             = "http-frontend"
      protocol                       = "Http"
      frontend_ip_configuration_name = "agw-frontend-config-01-pvt"
      host_name                      = "stgcms.sociowatch.in"
    },
    "http77" = {
      name                           = "ws-sociowatch-https-listener-01"
      frontend_port_name             = "https-frontend"
      protocol                       = "Https"
      ssl_certificate_name           = "Sociowatch-in-01"
      frontend_ip_configuration_name = "agw-frontend-config-01"
      host_name                      = "ws.sociowatch.in"
    },
    "http78" = {
      name                           = "ws-sociowatch-http-listener-01"
      frontend_port_name             = "http-frontend"
      protocol                       = "Http"
      frontend_ip_configuration_name = "agw-frontend-config-01"
      host_name                      = "ws.sociowatch.in"
    },
    "http79" = {
      name                           = "services-sociowatch-https-listener-01"
      frontend_port_name             = "https-frontend"
      protocol                       = "Https"
      ssl_certificate_name           = "Sociowatch-in-01"
      frontend_ip_configuration_name = "agw-frontend-config-01"
      host_name                      = "services.sociowatch.in"
    },
    "http80" = {
      name                           = "services-sociowatch-http-listener-01"
      frontend_port_name             = "http-frontend"
      protocol                       = "Http"
      frontend_ip_configuration_name = "agw-frontend-config-01"
      host_name                      = "services.sociowatch.in"
    },
    "http81" = {
      name                           = "artifacts-timesprism-https-listener-01"
      frontend_port_name             = "https-frontend"
      protocol                       = "Https"
      ssl_certificate_name           = "Timesprism-com-01"
      frontend_ip_configuration_name = "agw-frontend-config-01-pvt"
      host_name                      = "artifacts.timesprism.com"
    },
    "http82" = {
      name                           = "artifacts-timesprism-http-listener-01"
      frontend_port_name             = "http-frontend"
      protocol                       = "Http"
      frontend_ip_configuration_name = "agw-frontend-config-01-pvt"
      host_name                      = "artifacts.timesprism.com"
    },
    "http83" = {
      name                           = "monitor-sociowatch-https-listener-01"
      frontend_port_name             = "https-frontend"
      protocol                       = "Https"
      ssl_certificate_name           = "Sociowatch-in-01"
      frontend_ip_configuration_name = "agw-frontend-config-01-pvt"
      host_name                      = "monitor.sociowatch.in"
    },
    "http84" = {
      name                           = "monitor-sociowatch-http-listener-01"
      frontend_port_name             = "http-frontend"
      protocol                       = "Http"
      frontend_ip_configuration_name = "agw-frontend-config-01-pvt"
      host_name                      = "monitor.sociowatch.in"
    },
    "http85" = {
      name                           = "mediahub-timesprism-https-listener-01"
      frontend_port_name             = "https-frontend"
      protocol                       = "Https"
      ssl_certificate_name           = "Timesprism-com-01"
      frontend_ip_configuration_name = "agw-frontend-config-01"
      host_name                      = "mediahub.timesprism.com"
    },
    "http86" = {
      name                           = "mediahub-timesprism-http-listener-01"
      frontend_port_name             = "http-frontend"
      protocol                       = "Http"
      frontend_ip_configuration_name = "agw-frontend-config-01"
      host_name                      = "mediahub.timesprism.com"
    },
    "http87" = {
      name                           = "mediahubpvt-timesprism-https-listener-01"
      frontend_port_name             = "https-frontend"
      protocol                       = "Https"
      ssl_certificate_name           = "Timesprism-com-01"
      frontend_ip_configuration_name = "agw-frontend-config-01-pvt"
      host_name                      = "mediahubpvt.timesprism.com"
    },
    "http88" = {
      name                           = "mediahubpvt-timesprism-http-listener-01"
      frontend_port_name             = "http-frontend"
      protocol                       = "Http"
      frontend_ip_configuration_name = "agw-frontend-config-01-pvt"
      host_name                      = "mediahubpvt.timesprism.com"
    },
  }
  request_routing_rules = {
    "rrule1" = {
      name                       = "epitome-routing-rule-01"
      rule_type                  = "Basic"
      http_listener_name         = "epitome-https-listener-01"
      backend_address_pool_name  = "epitome-bpool1"
      priority                   = 100
      backend_http_settings_name = "epitome-backend-setting-01"
    },
    "rrule2" = {
      name                        = "epitome-routing-rule-02"
      rule_type                   = "Basic"
      http_listener_name          = "epitome-http-listener-01"
      priority                    = 110
      redirect_configuration_name = "epitome-redirection-01"
    },
    "rrule3" = {
      name                       = "bnews-routing-rule-01"
      rule_type                  = "Basic"
      http_listener_name         = "bnews-https-listener-01"
      backend_address_pool_name  = "bnews-bpool1"
      priority                   = 120
      backend_http_settings_name = "bnews-backend-setting-01"
    },
    "rrule4" = {
      name                        = "bnews-routing-rule-02"
      rule_type                   = "Basic"
      http_listener_name          = "bnews-http-listener-01"
      priority                    = 130
      redirect_configuration_name = "bnews-redirection-01"
    },
    "rrule5" = {
      name                       = "vspstatic-routing-rule-01"
      rule_type                  = "Basic"
      http_listener_name         = "vspstatic-https-listener-01"
      backend_address_pool_name  = "vspstatic-bpool1"
      priority                   = 140
      backend_http_settings_name = "vspstatic-backend-setting-01"
    },
    "rrule6" = {
      name                        = "vspstatic-routing-rule-02"
      rule_type                   = "Basic"
      http_listener_name          = "vspstatic-http-listener-01"
      priority                    = 150
      redirect_configuration_name = "vspstatic-redirection-01"
    },
    "rrule7" = {
      name                       = "cachemanager-routing-rule-01"
      rule_type                  = "Basic"
      http_listener_name         = "cachemanager-https-listener-01"
      backend_address_pool_name  = "cachemanager-bpool1"
      priority                   = 160
      backend_http_settings_name = "cachemanager-backend-setting-01"
    },
    "rrule8" = {
      name                        = "cachemanager-routing-rule-02"
      rule_type                   = "Basic"
      http_listener_name          = "cachemanager-http-listener-01"
      priority                    = 170
      redirect_configuration_name = "cachemanager-redirection-01"
    },
    "rrule9" = {
      name                       = "cachemaster-routing-rule-01"
      rule_type                  = "Basic"
      http_listener_name         = "cachemaster-https-listener-01"
      backend_address_pool_name  = "cachemaster-bpool1"
      priority                   = 180
      backend_http_settings_name = "cachemaster-backend-setting-01"
    },
    "rrule10" = {
      name                        = "cachemaster-routing-rule-02"
      rule_type                   = "Basic"
      http_listener_name          = "cachemaster-http-listener-01"
      priority                    = 190
      redirect_configuration_name = "cachemaster-redirection-01"
    },
    "rrule11" = {
      name                       = "vault-routing-rule-01"
      rule_type                  = "Basic"
      http_listener_name         = "vault-https-listener-01"
      backend_address_pool_name  = "vault-bpool1"
      priority                   = 200
      backend_http_settings_name = "vault-backend-setting-01"
    },
    "rrule12" = {
      name                        = "vault-routing-rule-02"
      rule_type                   = "Basic"
      http_listener_name          = "vault-http-listener-01"
      priority                    = 210
      redirect_configuration_name = "vault-redirection-01"
    },

    "rrule13" = {
      name                       = "mobile-routing-rule-01"
      rule_type                  = "Basic"
      http_listener_name         = "mobile-https-listener-01"
      backend_address_pool_name  = "mobile-bpool1"
      priority                   = 220
      backend_http_settings_name = "mobile-backend-setting-01"
    },
    "rrule14" = {
      name                        = "mobile-routing-rule-02"
      rule_type                   = "Basic"
      http_listener_name          = "mobile-http-listener-01"
      priority                    = 230
      redirect_configuration_name = "mobile-redirection-01"
    },

    "rrule15" = {
      name                       = "cmsanalytics-routing-rule-01"
      rule_type                  = "Basic"
      http_listener_name         = "cmsanalytics-https-listener-01"
      backend_address_pool_name  = "cmsanalytics-bpool1"
      priority                   = 240
      backend_http_settings_name = "cmsanalytics-backend-setting-01"
    },
    "rrule16" = {
      name                        = "cmsanalytics-routing-rule-02"
      rule_type                   = "Basic"
      http_listener_name          = "cmsanalytics-http-listener-01"
      priority                    = 250
      redirect_configuration_name = "cmsanalytics-redirection-01"
    },

    "rrule17" = {
      name                       = "cmsgraph-routing-rule-01"
      rule_type                  = "Basic"
      http_listener_name         = "cmsgraph-https-listener-01"
      backend_address_pool_name  = "cmsgraph-bpool1"
      priority                   = 260
      backend_http_settings_name = "cmsgraph-backend-setting-01"
    },
    "rrule18" = {
      name                        = "cmsgraph-routing-rule-02"
      rule_type                   = "Basic"
      http_listener_name          = "cmsgraph-http-listener-01"
      priority                    = 270
      redirect_configuration_name = "cmsgraph-redirection-01"
    },

    "rrule19" = {
      name                       = "cmsjsso-routing-rule-01"
      rule_type                  = "Basic"
      http_listener_name         = "cmsjsso-https-listener-01"
      backend_address_pool_name  = "cmsjsso-bpool1"
      priority                   = 280
      backend_http_settings_name = "cmsjsso-backend-setting-01"
    },
    "rrule20" = {
      name                        = "cmsjsso-routing-rule-02"
      rule_type                   = "Basic"
      http_listener_name          = "cmsjsso-http-listener-01"
      priority                    = 290
      redirect_configuration_name = "cmsjsso-redirection-01"
    },
    "rrule21" = {
      name                       = "cmssolrservices-routing-rule-01"
      rule_type                  = "Basic"
      http_listener_name         = "cmssolrservices-https-listener-01"
      backend_address_pool_name  = "cmssolrservices-bpool1"
      priority                   = 300
      backend_http_settings_name = "cmssolrservices-backend-setting-01"
    },
    "rrule22" = {
      name                        = "cmssolrservices-routing-rule-02"
      rule_type                   = "Basic"
      http_listener_name          = "cmssolrservices-http-listener-01"
      priority                    = 310
      redirect_configuration_name = "cmssolrservices-redirection-01"
    },

    "rrule23" = {
      name                       = "commentmoderator-routing-rule-01"
      rule_type                  = "Basic"
      http_listener_name         = "commentmoderator-https-listener-01"
      backend_address_pool_name  = "commentmoderator-bpool1"
      priority                   = 320
      backend_http_settings_name = "commentmoderator-backend-setting-01"
    },
    "rrule24" = {
      name                        = "commentmoderator-routing-rule-02"
      rule_type                   = "Basic"
      http_listener_name          = "commentmoderator-http-listener-01"
      priority                    = 330
      redirect_configuration_name = "commentmoderator-redirection-01"
    },

    "rrule25" = {
      name                       = "manage-routing-rule-01"
      rule_type                  = "Basic"
      http_listener_name         = "manage-https-listener-01"
      backend_address_pool_name  = "manage-bpool1"
      priority                   = 340
      backend_http_settings_name = "manage-backend-setting-01"
    },
    "rrule26" = {
      name                        = "manage-routing-rule-02"
      rule_type                   = "Basic"
      http_listener_name          = "manage-http-listener-01"
      priority                    = 350
      redirect_configuration_name = "manage-redirection-01"
    },

    "rrule27" = {
      name                       = "dam-routing-rule-01"
      rule_type                  = "Basic"
      http_listener_name         = "dam-https-listener-01"
      backend_address_pool_name  = "dam-bpool1"
      priority                   = 360
      backend_http_settings_name = "dam-backend-setting-01"
    },
    "rrule28" = {
      name                        = "dam-routing-rule-02"
      rule_type                   = "Basic"
      http_listener_name          = "dam-http-listener-01"
      priority                    = 370
      redirect_configuration_name = "dam-redirection-01"
    },

    "rrule29" = {
      name                       = "craft-routing-rule-01"
      rule_type                  = "Basic"
      http_listener_name         = "craft-https-listener-01"
      backend_address_pool_name  = "craft-bpool1"
      priority                   = 380
      backend_http_settings_name = "craft-backend-setting-01"
    },
    "rrule30" = {
      name                        = "craft-routing-rule-02"
      rule_type                   = "Basic"
      http_listener_name          = "craft-http-listener-01"
      priority                    = 390
      redirect_configuration_name = "craft-redirection-01"
    },

    "rrule31" = {
      name                       = "evolveai-routing-rule-01"
      rule_type                  = "Basic"
      http_listener_name         = "evolveai-https-listener-01"
      backend_address_pool_name  = "evolveai-bpool1"
      priority                   = 400
      backend_http_settings_name = "evolveai-backend-setting-01"
    },
    "rrule32" = {
      name                        = "evolveai-routing-rule-02"
      rule_type                   = "Basic"
      http_listener_name          = "evolveai-http-listener-01"
      priority                    = 410
      redirect_configuration_name = "evolveai-redirection-01"
    },

    "rrule33" = {
      name                       = "indweller-routing-rule-01"
      rule_type                  = "Basic"
      http_listener_name         = "indweller-https-listener-01"
      backend_address_pool_name  = "indweller-bpool1"
      priority                   = 420
      backend_http_settings_name = "indweller-backend-setting-01"
    },
    "rrule34" = {
      name                        = "indweller-routing-rule-02"
      rule_type                   = "Basic"
      http_listener_name          = "indweller-http-listener-01"
      priority                    = 430
      redirect_configuration_name = "indweller-redirection-01"
    },

    "rrule35" = {
      name                       = "sso-routing-rule-01"
      rule_type                  = "Basic"
      http_listener_name         = "sso-https-listener-01"
      backend_address_pool_name  = "sso-bpool1"
      priority                   = 440
      backend_http_settings_name = "sso-backend-setting-01"
    },
    "rrule36" = {
      name                        = "sso-routing-rule-02"
      rule_type                   = "Basic"
      http_listener_name          = "sso-http-listener-01"
      priority                    = 450
      redirect_configuration_name = "sso-redirection-01"
    },
    "rrule37" = {
      name                       = "medley-routing-rule-01"
      rule_type                  = "Basic"
      http_listener_name         = "medley-https-listener-01"
      backend_address_pool_name  = "medley-bpool1"
      priority                   = 460
      backend_http_settings_name = "medley-backend-setting-01"
    },
    "rrule38" = {
      name                        = "medley-routing-rule-02"
      rule_type                   = "Basic"
      http_listener_name          = "medley-http-listener-01"
      priority                    = 470
      redirect_configuration_name = "medley-redirection-01"
    },
    "rrule39" = {
      name                       = "mra-routing-rule-01"
      rule_type                  = "Basic"
      http_listener_name         = "mra-https-listener-01"
      backend_address_pool_name  = "mra-bpool1"
      priority                   = 480
      backend_http_settings_name = "mra-backend-setting-01"
    },
    "rrule40" = {
      name                        = "mra-routing-rule-02"
      rule_type                   = "Basic"
      http_listener_name          = "mra-http-listener-01"
      priority                    = 490
      redirect_configuration_name = "mra-redirection-01"
    },
    "rrule41" = {
      name                       = "myt-routing-rule-01"
      rule_type                  = "Basic"
      http_listener_name         = "myt-https-listener-01"
      backend_address_pool_name  = "myt-bpool1"
      priority                   = 500
      backend_http_settings_name = "myt-backend-setting-01"
    },
    "rrule42" = {
      name                        = "myt-routing-rule-02"
      rule_type                   = "Basic"
      http_listener_name          = "myt-http-listener-01"
      priority                    = 510
      redirect_configuration_name = "myt-redirection-01"
    },
    "rrule43" = {
      name                       = "orion-routing-rule-01"
      rule_type                  = "Basic"
      http_listener_name         = "orion-https-listener-01"
      backend_address_pool_name  = "orion-bpool1"
      priority                   = 520
      backend_http_settings_name = "orion-backend-setting-01"
    },
    "rrule44" = {
      name                        = "orion-routing-rule-02"
      rule_type                   = "Basic"
      http_listener_name          = "orion-http-listener-01"
      priority                    = 530
      redirect_configuration_name = "orion-redirection-01"
    },
    "rrule45" = {
      name                       = "socialappsintegrator-routing-rule-01"
      rule_type                  = "Basic"
      http_listener_name         = "socialappsintegrator-https-listener-01"
      backend_address_pool_name  = "socialappsintegrator-bpool1"
      priority                   = 540
      backend_http_settings_name = "socialappsintegrator-backend-setting-01"
    },
    "rrule46" = {
      name                        = "socialappsintegrator-routing-rule-02"
      rule_type                   = "Basic"
      http_listener_name          = "socialappsintegrator-http-listener-01"
      priority                    = 550
      redirect_configuration_name = "socialappsintegrator-redirection-01"
    },

    "rrule47" = {
      name                       = "solrapps-routing-rule-01"
      rule_type                  = "Basic"
      http_listener_name         = "solrapps-https-listener-01"
      backend_address_pool_name  = "solrapps-bpool1"
      priority                   = 560
      backend_http_settings_name = "solrapps-backend-setting-01"
    },
    "rrule48" = {
      name                        = "solrapps-routing-rule-02"
      rule_type                   = "Basic"
      http_listener_name          = "solrapps-http-listener-01"
      priority                    = 570
      redirect_configuration_name = "solrapps-redirection-01"
    },
    "rrule49" = {
      name                       = "minio-routing-rule-01"
      rule_type                  = "Basic"
      http_listener_name         = "minio-https-listener-01"
      backend_address_pool_name  = "minio-bpool1"
      priority                   = 580
      backend_http_settings_name = "minio-backend-setting-01"
    },
    "rrule50" = {
      name                        = "minio-routing-rule-02"
      rule_type                   = "Basic"
      http_listener_name          = "minio-http-listener-01"
      priority                    = 590
      redirect_configuration_name = "minio-redirection-01"
    },
    "rrule51" = {
      name                       = "console-minio-routing-rule-01"
      rule_type                  = "Basic"
      http_listener_name         = "console-minio-https-listener-01"
      backend_address_pool_name  = "minio-bpool1"
      priority                   = 600
      backend_http_settings_name = "console-minio-backend-setting-01"
    },
    "rrule52" = {
      name                        = "console-minio-routing-rule-02"
      rule_type                   = "Basic"
      http_listener_name          = "console-minio-http-listener-01"
      priority                    = 610
      redirect_configuration_name = "console-minio-redirection-01"
    },
    "rrule53" = {
      name                       = "jcmssolr-routing-rule-01"
      rule_type                  = "Basic"
      http_listener_name         = "jcmssolr-https-listener-01"
      backend_address_pool_name  = "jcmssolr-bpool1"
      priority                   = 620
      backend_http_settings_name = "jcmssolr-backend-setting-01"
    },
    "rrule54" = {
      name                        = "jcmssolr-routing-rule-02"
      rule_type                   = "Basic"
      http_listener_name          = "jcmssolr-http-listener-01"
      priority                    = 630
      redirect_configuration_name = "jcmssolr-redirection-01"
    },
    "rrule55" = {
      name                       = "services-orion-routing-rule-01"
      rule_type                  = "Basic"
      http_listener_name         = "services-orion-https-listener-01"
      backend_address_pool_name  = "services-orion-bpool1"
      priority                   = 640
      backend_http_settings_name = "services-orion-backend-setting-01"
    },
    "rrule56" = {
      name                        = "services-orion-routing-rule-02"
      rule_type                   = "Basic"
      http_listener_name          = "services-orion-http-listener-01"
      priority                    = 650
      redirect_configuration_name = "services-orion-redirection-01"
    },
    "rrule57" = {
      name                       = "solrdenmark-routing-rule-01"
      rule_type                  = "Basic"
      http_listener_name         = "solrdenmark-https-listener-01"
      backend_address_pool_name  = "solrdenmark-bpool1"
      priority                   = 660
      backend_http_settings_name = "solrdenmark-backend-setting-01"
    },
    "rrule58" = {
      name                        = "solrdenmark-routing-rule-02"
      rule_type                   = "Basic"
      http_listener_name          = "solrdenmark-http-listener-01"
      priority                    = 670
      redirect_configuration_name = "solrdenmark-redirection-01"
    },
    # "rrule59" = {
    #   name                       = "tenant-security-routing-rule-01"
    #   rule_type                  = "Basic"
    #   http_listener_name         = "tenant-security-https-listener-01"
    #   backend_address_pool_name  = "tenant-security-bpool1"
    #   priority                   = 680
    #   backend_http_settings_name = "tenant-security-backend-setting-01"
    # },
    # "rrule60" = {
    #   name                        = "tenant-security-routing-rule-02"
    #   rule_type                   = "Basic"
    #   http_listener_name          = "tenant-security-http-listener-01"
    #   priority                    = 690
    #   redirect_configuration_name = "tenant-security-redirection-01"
    # },
    "rrule61" = {
      name                       = "scribbler-routing-rule-01"
      rule_type                  = "Basic"
      http_listener_name         = "scribbler-https-listener-01"
      backend_address_pool_name  = "scribbler-bpool1"
      priority                   = 700
      backend_http_settings_name = "scribbler-backend-setting-01"
    },
    "rrule62" = {
      name                        = "scribbler-routing-rule-02"
      rule_type                   = "Basic"
      http_listener_name          = "scribbler-http-listener-01"
      priority                    = 710
      redirect_configuration_name = "scribbler-redirection-01"
    },
    "rrule63" = {
      name                       = "stories-routing-rule-01"
      rule_type                  = "Basic"
      http_listener_name         = "stories-https-listener-01"
      backend_address_pool_name  = "stories-bpool1"
      priority                   = 720
      backend_http_settings_name = "stories-backend-setting-01"
    },
    "rrule64" = {
      name                        = "stories-routing-rule-02"
      rule_type                   = "Basic"
      http_listener_name          = "stories-http-listener-01"
      priority                    = 730
      redirect_configuration_name = "stories-redirection-01"
    },
    "rrule65" = {
      name               = "cloudservices-routing-rule-01"
      rule_type          = "PathBasedRouting"
      http_listener_name = "cloudservices-https-listener-01"
      priority           = 740
      url_path_map_name  = "urlpath1"
    },
    "rrule66" = {
      name                        = "cloudservices-routing-rule-02"
      rule_type                   = "Basic"
      http_listener_name          = "cloudservices-http-listener-01"
      priority                    = 750
      redirect_configuration_name = "cloudservices-redirection-01"
    },
    "rrule67" = {
      name                       = "assets-sociowatch-routing-rule-01"
      rule_type                  = "Basic"
      http_listener_name         = "assets-sociowatch-https-listener-01"
      backend_address_pool_name  = "assets-sociowatch-bpool1"
      priority                   = 760
      backend_http_settings_name = "assets-sociowatch-backend-setting-01"
    },
    "rrule68" = {
      name                        = "assets-sociowatch-routing-rule-02"
      rule_type                   = "Basic"
      http_listener_name          = "assets-sociowatch-http-listener-01"
      priority                    = 770
      redirect_configuration_name = "assets-sociowatch-redirection-01"
    },
    "rrule71" = {
      name                       = "cms-sociowatch-routing-rule-03"
      rule_type                  = "Basic"
      http_listener_name         = "cms-sociowatch-https-listener-02"
      backend_address_pool_name  = "cms-sociowatch-bpool1"
      priority                   = 800
      backend_http_settings_name = "cms-sociowatch-backend-setting-02"
    },
    "rrule72" = {
      name                        = "cms-sociowatch-routing-rule-04"
      rule_type                   = "Basic"
      http_listener_name          = "cms-sociowatch-http-listener-02"
      priority                    = 810
      redirect_configuration_name = "cms-sociowatch-redirection-02"
    },
    "rrule73" = {
      name                       = "logs-sociowatch-routing-rule-01"
      rule_type                  = "Basic"
      http_listener_name         = "logs-sociowatch-https-listener-01"
      backend_address_pool_name  = "logs-sociowatch-bpool1"
      priority                   = 820
      backend_http_settings_name = "logs-sociowatch-backend-setting-01"
    },
    "rrule74" = {
      name                        = "logs-sociowatch-routing-rule-02"
      rule_type                   = "Basic"
      http_listener_name          = "logs-sociowatch-http-listener-01"
      priority                    = 830
      redirect_configuration_name = "logs-sociowatch-redirection-01"
    },
    "rrule75" = {
      name                       = "stgcms-sociowatch-routing-rule-01"
      rule_type                  = "Basic"
      http_listener_name         = "stgcms-sociowatch-https-listener-01"
      backend_address_pool_name  = "stgcms-sociowatch-bpool1"
      priority                   = 840
      backend_http_settings_name = "stgcms-sociowatch-backend-setting-01"
    },
    "rrule76" = {
      name                        = "stgcms-sociowatch-routing-rule-02"
      rule_type                   = "Basic"
      http_listener_name          = "stgcms-sociowatch-http-listener-01"
      priority                    = 850
      redirect_configuration_name = "stgcms-sociowatch-redirection-01"
    },
    "rrule77" = {
      name                       = "ws-sociowatch-routing-rule-01"
      rule_type                  = "Basic"
      http_listener_name         = "ws-sociowatch-https-listener-01"
      backend_address_pool_name  = "ws-sociowatch-bpool1"
      priority                   = 860
      backend_http_settings_name = "ws-sociowatch-backend-setting-01"
    },
    "rrule78" = {
      name                        = "ws-sociowatch-routing-rule-02"
      rule_type                   = "Basic"
      http_listener_name          = "ws-sociowatch-http-listener-01"
      priority                    = 870
      redirect_configuration_name = "ws-sociowatch-redirection-01"
    },
    "rrule79" = {
      name                       = "services-sociowatch-routing-rule-01"
      rule_type                  = "Basic"
      http_listener_name         = "services-sociowatch-https-listener-01"
      backend_address_pool_name  = "ws-sociowatch-bpool1"
      priority                   = 880
      backend_http_settings_name = "services-sociowatch-backend-setting-01"
    },
    "rrule80" = {
      name                        = "services-sociowatch-routing-rule-02"
      rule_type                   = "Basic"
      http_listener_name          = "services-sociowatch-http-listener-01"
      priority                    = 890
      redirect_configuration_name = "services-sociowatch-redirection-01"
    },
    "rrule81" = {
      name                       = "artifacts-timesprism-routing-rule-01"
      rule_type                  = "Basic"
      http_listener_name         = "artifacts-timesprism-https-listener-01"
      backend_address_pool_name  = "artifacts-timesprism-bpool1"
      priority                   = 900
      backend_http_settings_name = "artifacts-timesprism-backend-setting-01"
    },
    "rrule82" = {
      name                        = "artifacts-timesprism-routing-rule-02"
      rule_type                   = "Basic"
      http_listener_name          = "artifacts-timesprism-http-listener-01"
      priority                    = 910
      redirect_configuration_name = "artifacts-timesprism-redirection-01"
    },
    "rrule83" = {
      name                       = "monitor-sociowatch-routing-rule-01"
      rule_type                  = "Basic"
      http_listener_name         = "monitor-sociowatch-https-listener-01"
      backend_address_pool_name  = "ws-sociowatch-bpool1"
      priority                   = 920
      backend_http_settings_name = "monitor-sociowatch-backend-setting-01"
    },
    "rrule84" = {
      name                        = "monitor-sociowatch-routing-rule-02"
      rule_type                   = "Basic"
      http_listener_name          = "monitor-sociowatch-http-listener-01"
      priority                    = 930
      redirect_configuration_name = "monitor-sociowatch-redirection-01"
    },
    "rrule85" = {
      name                       = "mediahub-timesprism-routing-rule-01"
      rule_type                  = "Basic"
      http_listener_name         = "mediahub-timesprism-https-listener-01"
      backend_address_pool_name  = "mediahub-timesprism-bpool1"
      priority                   = 940
      backend_http_settings_name = "mediahub-timesprism-backend-setting-01"
    },
    "rrule86" = {
      name                        = "mediahub-timesprism-routing-rule-02"
      rule_type                   = "Basic"
      http_listener_name          = "mediahub-timesprism-http-listener-01"
      priority                    = 950
      redirect_configuration_name = "mediahub-timesprism-redirection-01"
    },
    "rrule87" = {
      name                       = "mediahubpvt-timesprism-routing-rule-01"
      rule_type                  = "Basic"
      http_listener_name         = "mediahubpvt-timesprism-https-listener-01"
      backend_address_pool_name  = "mediahub-timesprism-bpool1"
      priority                   = 960
      backend_http_settings_name = "mediahubpvt-timesprism-backend-setting-01"
    },
    "rrule88" = {
      name                        = "mediahubpvt-timesprism-routing-rule-02"
      rule_type                   = "Basic"
      http_listener_name          = "mediahubpvt-timesprism-http-listener-01"
      priority                    = 970
      redirect_configuration_name = "mediahubpvt-timesprism-redirection-01"
    },
  }

  url_path_maps = {
    "path1" = {
      name                                = "urlpath1"
      default_backend_address_pool_name   = "cloudservices-bpool1"
      default_backend_http_settings_name  = "cloudservices-backend-setting-01"
      default_redirect_configuration_name = null
      path_rule = {
        "path1" = {
          name                       = "pathrule1"
          paths                      = ["/cms-api"]
          backend_address_pool_name  = "cloudservices-cms-api-bpool1"
          backend_http_settings_name = "cloudservices-cms-api-backend-setting-01"
        },
        "path2" = {
          name                       = "pathrule2"
          paths                      = ["/cms-gn"]
          backend_address_pool_name  = "cloudservices-cms-gn-bpool1"
          backend_http_settings_name = "cloudservices-cms-gn-backend-setting-01"
        },
        "path3" = {
          name                       = "pathrule3"
          paths                      = ["/cms-ext/*"]
          backend_address_pool_name  = "cloudservices-cms-ext-bpool1"
          backend_http_settings_name = "cloudservices-cms-ext-backend-setting-01"
        },
        "path4" = {
          name                       = "pathrule4"
          paths                      = ["/cms-search/*"]
          backend_address_pool_name  = "cloudservices-cms-search-bpool1"
          backend_http_settings_name = "cloudservices-cms-search-backend-setting-01"
        },
        "path5" = {
          name                       = "pathrule5"
          paths                      = ["/cms-gn/*"]
          backend_address_pool_name  = "cloudservices-cms-gn-bpool1"
          backend_http_settings_name = "cloudservices-cms-gn-backend-setting-01"
        },
        "path6" = {
          name                       = "pathrule6"
          paths                      = ["/cms-analytics/*"]
          backend_address_pool_name  = "cloudservices-cms-analytics-bpool1"
          backend_http_settings_name = "cloudservices-cms-analytics-backend-setting-01"
        },
        "path7" = {
          name                       = "pathrule7"
          paths                      = ["/cms-api/*"]
          backend_address_pool_name  = "cloudservices-cms-api-bpool1"
          backend_http_settings_name = "cloudservices-cms-api-backend-setting-01"
        },
        "path8" = {
          name                       = "pathrule8"
          paths                      = ["/cms-search"]
          backend_address_pool_name  = "cloudservices-cms-search-bpool1"
          backend_http_settings_name = "cloudservices-cms-search-backend-setting-01"
        },
        "path9" = {
          name                       = "pathrule9"
          paths                      = ["/cms-ext"]
          backend_address_pool_name  = "cloudservices-cms-ext-bpool1"
          backend_http_settings_name = "cloudservices-cms-ext-backend-setting-01"
        },
        "path10" = {
          name                       = "pathrule10"
          paths                      = ["/cms-analytics"]
          backend_address_pool_name  = "cloudservices-cms-analytics-bpool1"
          backend_http_settings_name = "cloudservices-cms-analytics-backend-setting-01"
        }
      },
    }
  }
  redirect_configuration = {
    "redirection1" = {
      name                 = "epitome-redirection-01"
      redirect_type        = "Permanent"
      target_listener_name = "epitome-https-listener-01"
      include_path         = true
      include_query_string = true
    },
    "redirection2" = {
      name                 = "bnews-redirection-01"
      redirect_type        = "Permanent"
      target_listener_name = "bnews-https-listener-01"
      include_path         = true
      include_query_string = true
    },
    "redirection3" = {
      name                 = "vspstatic-redirection-01"
      redirect_type        = "Permanent"
      target_listener_name = "vspstatic-https-listener-01"
      include_path         = true
      include_query_string = true
    },
    "redirection4" = {
      name                 = "cachemanager-redirection-01"
      redirect_type        = "Permanent"
      target_listener_name = "cachemanager-https-listener-01"
      include_path         = true
      include_query_string = true
    },
    "redirection5" = {
      name                 = "cachemaster-redirection-01"
      redirect_type        = "Permanent"
      target_listener_name = "cachemaster-https-listener-01"
      include_path         = true
      include_query_string = true
    },
    "redirection6" = {
      name                 = "vault-redirection-01"
      redirect_type        = "Permanent"
      target_listener_name = "vault-https-listener-01"
      include_path         = true
      include_query_string = true
    },
    "redirection7" = {
      name                 = "mobile-redirection-01"
      redirect_type        = "Permanent"
      target_listener_name = "mobile-https-listener-01"
      include_path         = true
      include_query_string = true
    },
    "redirection8" = {
      name                 = "cmsanalytics-redirection-01"
      redirect_type        = "Permanent"
      target_listener_name = "cmsanalytics-https-listener-01"
      include_path         = true
      include_query_string = true
    },
    "redirection9" = {
      name                 = "cmsgraph-redirection-01"
      redirect_type        = "Permanent"
      target_listener_name = "cmsgraph-https-listener-01"
      include_path         = true
      include_query_string = true
    },
    "redirection10" = {
      name                 = "cmsjsso-redirection-01"
      redirect_type        = "Permanent"
      target_listener_name = "cmsjsso-https-listener-01"
      include_path         = true
      include_query_string = true
    },
    "redirection11" = {
      name                 = "cmssolrservices-redirection-01"
      redirect_type        = "Permanent"
      target_listener_name = "cmssolrservices-https-listener-01"
      include_path         = true
      include_query_string = true
    },
    "redirection12" = {
      name                 = "commentmoderator-redirection-01"
      redirect_type        = "Permanent"
      target_listener_name = "commentmoderator-https-listener-01"
      include_path         = true
      include_query_string = true
    },
    "redirection13" = {
      name                 = "manage-redirection-01"
      redirect_type        = "Permanent"
      target_listener_name = "manage-https-listener-01"
      include_path         = true
      include_query_string = true
    },
    "redirection14" = {
      name                 = "dam-redirection-01"
      redirect_type        = "Permanent"
      target_listener_name = "dam-https-listener-01"
      include_path         = true
      include_query_string = true
    },
    "redirection15" = {
      name                 = "craft-redirection-01"
      redirect_type        = "Permanent"
      target_listener_name = "craft-https-listener-01"
      include_path         = true
      include_query_string = true
    },
    "redirection16" = {
      name                 = "evolveai-redirection-01"
      redirect_type        = "Permanent"
      target_listener_name = "evolveai-https-listener-01"
      include_path         = true
      include_query_string = true
    },
    "redirection17" = {
      name                 = "indweller-redirection-01"
      redirect_type        = "Permanent"
      target_listener_name = "indweller-https-listener-01"
      include_path         = true
      include_query_string = true
    },
    "redirection18" = {
      name                 = "sso-redirection-01"
      redirect_type        = "Permanent"
      target_listener_name = "sso-https-listener-01"
      include_path         = true
      include_query_string = true
    },
    "redirection19" = {
      name                 = "medley-redirection-01"
      redirect_type        = "Permanent"
      target_listener_name = "medley-https-listener-01"
      include_path         = true
      include_query_string = true
    },
    "redirection20" = {
      name                 = "mra-redirection-01"
      redirect_type        = "Permanent"
      target_listener_name = "mra-https-listener-01"
      include_path         = true
      include_query_string = true
    },
    "redirection21" = {
      name                 = "myt-redirection-01"
      redirect_type        = "Permanent"
      target_listener_name = "myt-https-listener-01"
      include_path         = true
      include_query_string = true
    },
    "redirection22" = {
      name                 = "orion-redirection-01"
      redirect_type        = "Permanent"
      target_listener_name = "orion-https-listener-01"
      include_path         = true
      include_query_string = true
    },
    "redirection23" = {
      name                 = "socialappsintegrator-redirection-01"
      redirect_type        = "Permanent"
      target_listener_name = "socialappsintegrator-https-listener-01"
      include_path         = true
      include_query_string = true
    },
    "redirection24" = {
      name                 = "solrapps-redirection-01"
      redirect_type        = "Permanent"
      target_listener_name = "solrapps-https-listener-01"
      include_path         = true
      include_query_string = true
    },
    "redirection25" = {
      name                 = "minio-redirection-01"
      redirect_type        = "Permanent"
      target_listener_name = "minio-https-listener-01"
      include_path         = true
      include_query_string = true
    },
    "redirection26" = {
      name                 = "console-minio-redirection-01"
      redirect_type        = "Permanent"
      target_listener_name = "console-minio-https-listener-01"
      include_path         = true
      include_query_string = true
    },
    "redirection27" = {
      name                 = "jcmssolr-redirection-01"
      redirect_type        = "Permanent"
      target_listener_name = "jcmssolr-https-listener-01"
      include_path         = true
      include_query_string = true
    },
    "redirection28" = {
      name                 = "services-orion-redirection-01"
      redirect_type        = "Permanent"
      target_listener_name = "services-orion-https-listener-01"
      include_path         = true
      include_query_string = true
    },
    "redirection29" = {
      name                 = "solrdenmark-redirection-01"
      redirect_type        = "Permanent"
      target_listener_name = "solrdenmark-https-listener-01"
      include_path         = true
      include_query_string = true
    },
    # "redirection30" = {
    #   name                 = "tenant-security-redirection-01"
    #   redirect_type        = "Permanent"
    #   target_listener_name = "tenant-security-https-listener-01"
    #   include_path         = true
    #   include_query_string = true
    # },
    "redirection31" = {
      name                 = "scribbler-redirection-01"
      redirect_type        = "Permanent"
      target_listener_name = "scribbler-https-listener-01"
      include_path         = true
      include_query_string = true
    },
    "redirection32" = {
      name                 = "stories-redirection-01"
      redirect_type        = "Permanent"
      target_listener_name = "stories-https-listener-01"
      include_path         = true
      include_query_string = true
    },
    "redirection33" = {
      name                 = "cloudservices-redirection-01"
      redirect_type        = "Permanent"
      target_listener_name = "cloudservices-https-listener-01"
      include_path         = true
      include_query_string = true
    },
    "redirection34" = {
      name                 = "assets-sociowatch-redirection-01"
      redirect_type        = "Permanent"
      target_listener_name = "assets-sociowatch-https-listener-01"
      include_path         = true
      include_query_string = true
    },
    "redirection36" = {
      name                 = "cms-sociowatch-redirection-02"
      redirect_type        = "Permanent"
      target_listener_name = "cms-sociowatch-https-listener-02"
      include_path         = true
      include_query_string = true
    },
    "redirection37" = {
      name                 = "logs-sociowatch-redirection-01"
      redirect_type        = "Permanent"
      target_listener_name = "logs-sociowatch-https-listener-01"
      include_path         = true
      include_query_string = true
    },
    "redirection38" = {
      name                 = "stgcms-sociowatch-redirection-01"
      redirect_type        = "Permanent"
      target_listener_name = "stgcms-sociowatch-https-listener-01"
      include_path         = true
      include_query_string = true
    },
    "redirection39" = {
      name                 = "ws-sociowatch-redirection-01"
      redirect_type        = "Permanent"
      target_listener_name = "ws-sociowatch-https-listener-01"
      include_path         = true
      include_query_string = true
    },
    "redirection40" = {
      name                 = "services-sociowatch-redirection-01"
      redirect_type        = "Permanent"
      target_listener_name = "services-sociowatch-https-listener-01"
      include_path         = true
      include_query_string = true
    },
    "redirection42" = {
      name                 = "artifacts-timesprism-redirection-01"
      redirect_type        = "Permanent"
      target_listener_name = "artifacts-timesprism-https-listener-01"
      include_path         = true
      include_query_string = true
    },
    "redirection41" = {
      name                 = "monitor-sociowatch-redirection-01"
      redirect_type        = "Permanent"
      target_listener_name = "monitor-sociowatch-https-listener-01"
      include_path         = true
      include_query_string = true
    },
    "redirection43" = {
      name                 = "mediahub-timesprism-redirection-01"
      redirect_type        = "Permanent"
      target_listener_name = "mediahub-timesprism-https-listener-01"
      include_path         = true
      include_query_string = true
    },
    "redirection44" = {
      name                 = "mediahubpvt-timesprism-redirection-01"
      redirect_type        = "Permanent"
      target_listener_name = "mediahubpvt-timesprism-https-listener-01"
      include_path         = true
      include_query_string = true
    },
  }

  probes = {
    "probe1" = {
      name                                      = "epitome-health-probe-01"
      protocol                                  = "Http"
      interval                                  = 30
      timeout                                   = 30
      unhealthy_threshold                       = 3
      pick_host_name_from_backend_http_settings = false
      hostname                                  = "epitome.timesprism.com"
      path                                      = "/healthcheck"
      status_code                               = "200-399"
    },
    "probe2" = {
      name                                      = "bnews-health-probe-01"
      protocol                                  = "Http"
      interval                                  = 30
      timeout                                   = 30
      unhealthy_threshold                       = 3
      pick_host_name_from_backend_http_settings = false
      hostname                                  = "timesprism.com"
      path                                      = "/"
      status_code                               = "200-399"
    },
    "probe3" = {
      name                                      = "vspstatic-health-probe-01"
      protocol                                  = "Http"
      interval                                  = 30
      timeout                                   = 30
      unhealthy_threshold                       = 3
      pick_host_name_from_backend_http_settings = false
      hostname                                  = "vspstatic.timesprism.com"
      path                                      = "/status"
      status_code                               = "200-399"
    },
    "probe4" = {
      name                                      = "cachemanager-health-probe-01"
      protocol                                  = "Http"
      interval                                  = 30
      timeout                                   = 30
      unhealthy_threshold                       = 3
      pick_host_name_from_backend_http_settings = false
      hostname                                  = "cachemanager.timesprism.com"
      path                                      = "/cache/api/health"
      status_code                               = "200-399"
    },
    "probe5" = {
      name                                      = "cachemaster-health-probe-01"
      protocol                                  = "Http"
      interval                                  = 30
      timeout                                   = 30
      unhealthy_threshold                       = 3
      pick_host_name_from_backend_http_settings = false
      hostname                                  = "cachemaster.timesprism.com"
      path                                      = "/heartBeat"
      status_code                               = "200-399"
    },
    "probe6" = {
      name                                      = "vault-health-probe-01"
      protocol                                  = "Http"
      interval                                  = 30
      timeout                                   = 30
      unhealthy_threshold                       = 3
      pick_host_name_from_backend_http_settings = false
      hostname                                  = "vault.timesprism.com"
      path                                      = "/"
      status_code                               = "200-399"
    },
    "probe7" = {
      name                                      = "mobile-health-probe-01"
      protocol                                  = "Http"
      interval                                  = 30
      timeout                                   = 30
      unhealthy_threshold                       = 3
      pick_host_name_from_backend_http_settings = false
      hostname                                  = "mobile.timesprism.com"
      path                                      = "/"
      status_code                               = "200-399"
    },
    "probe8" = {
      name                                      = "cmsanalytics-health-probe-01"
      protocol                                  = "Http"
      interval                                  = 30
      timeout                                   = 30
      unhealthy_threshold                       = 3
      pick_host_name_from_backend_http_settings = false
      hostname                                  = "cmsanalytics.timesprism.com"
      path                                      = "/analyticswebapi/hello"
      status_code                               = "200-399"
    },
    "probe9" = {
      name                                      = "cmsgraph-health-probe-01"
      protocol                                  = "Http"
      interval                                  = 30
      timeout                                   = 30
      unhealthy_threshold                       = 3
      pick_host_name_from_backend_http_settings = false
      hostname                                  = "cmsgraph.timesprism.com"
      path                                      = "/healthcheck"
      status_code                               = "200-399"
    },
    "probe10" = {
      name                                      = "cmsjsso-health-probe-01"
      protocol                                  = "Http"
      interval                                  = 30
      timeout                                   = 30
      unhealthy_threshold                       = 3
      pick_host_name_from_backend_http_settings = false
      hostname                                  = "cmsjsso.timesprism.com"
      path                                      = "/"
      status_code                               = "200-399"
    },
    "probe11" = {
      name                                      = "cmssolrservices-health-probe-01"
      protocol                                  = "Http"
      interval                                  = 30
      timeout                                   = 30
      unhealthy_threshold                       = 3
      pick_host_name_from_backend_http_settings = false
      hostname                                  = "cmssolrservices.timesprism.com"
      path                                      = "/solr/TOI/admin/ping"
      status_code                               = "200-399"
    },
    "probe12" = {
      name                                      = "commentmoderator-health-probe-01"
      protocol                                  = "Http"
      interval                                  = 30
      timeout                                   = 30
      unhealthy_threshold                       = 3
      pick_host_name_from_backend_http_settings = false
      hostname                                  = "commentmoderator.timesprism.com"
      path                                      = "/"
      status_code                               = "200-399"
    },
    "probe13" = {
      name                                      = "manage-health-probe-01"
      protocol                                  = "Https"
      interval                                  = 30
      timeout                                   = 30
      unhealthy_threshold                       = 3
      pick_host_name_from_backend_http_settings = false
      hostname                                  = "manage.timesprism.com"
      path                                      = "/coral/utility/test"
      status_code                               = "200-399"
    },
    "probe14" = {
      name                                      = "dam-health-probe-01"
      protocol                                  = "Http"
      interval                                  = 30
      timeout                                   = 30
      unhealthy_threshold                       = 3
      pick_host_name_from_backend_http_settings = false
      hostname                                  = "dam.timesprism.com"
      path                                      = "/"
      status_code                               = "200-399"
    },
    "probe15" = {
      name                                      = "craft-health-probe-01"
      protocol                                  = "Https"
      interval                                  = 30
      timeout                                   = 30
      unhealthy_threshold                       = 3
      pick_host_name_from_backend_http_settings = false
      hostname                                  = "craft.timesprism.com"
      path                                      = "/cmslite/api/lite/dummyGet"
      status_code                               = "200-399"
    },
    "probe16" = {
      name                                      = "evolveai-health-probe-01"
      protocol                                  = "Http"
      interval                                  = 30
      timeout                                   = 30
      unhealthy_threshold                       = 3
      pick_host_name_from_backend_http_settings = false
      hostname                                  = "evolveai.timesprism.com"
      path                                      = "/evolve-content/apis/healthcheck"
      status_code                               = "200-399"
    },
    "probe17" = {
      name                                      = "indweller-health-probe-01"
      protocol                                  = "Http"
      interval                                  = 30
      timeout                                   = 30
      unhealthy_threshold                       = 3
      pick_host_name_from_backend_http_settings = false
      hostname                                  = "indweller.timesprism.com"
      path                                      = "/healthcheck"
      status_code                               = "200-399"
    },
    "probe18" = {
      name                                      = "sso-health-probe-01"
      protocol                                  = "Http"
      interval                                  = 30
      timeout                                   = 30
      unhealthy_threshold                       = 3
      pick_host_name_from_backend_http_settings = false
      hostname                                  = "sso.timesprism.com"
      path                                      = "/"
      status_code                               = "200-399"
    },
    "probe19" = {
      name                                      = "medley-health-probe-01"
      protocol                                  = "Http"
      interval                                  = 30
      timeout                                   = 30
      unhealthy_threshold                       = 3
      pick_host_name_from_backend_http_settings = false
      hostname                                  = "medley.timesprism.com"
      path                                      = "/"
      status_code                               = "200-399"
    },
    "probe20" = {
      name                                      = "mra-health-probe-01"
      protocol                                  = "Http"
      interval                                  = 30
      timeout                                   = 30
      unhealthy_threshold                       = 3
      pick_host_name_from_backend_http_settings = false
      hostname                                  = "mra.timesprism.com"
      path                                      = "/"
      status_code                               = "200-399"
    },
    "probe21" = {
      name                                      = "myt-health-probe-01"
      protocol                                  = "Http"
      interval                                  = 30
      timeout                                   = 30
      unhealthy_threshold                       = 3
      pick_host_name_from_backend_http_settings = false
      hostname                                  = "myt.timesprism.com"
      path                                      = "/"
      status_code                               = "200-399"
    },
    "probe22" = {
      name                                      = "orion-health-probe-01"
      protocol                                  = "Http"
      interval                                  = 30
      timeout                                   = 30
      unhealthy_threshold                       = 3
      pick_host_name_from_backend_http_settings = false
      hostname                                  = "orion.timesprism.com"
      path                                      = "/SolrKeywordSearch/status"
      status_code                               = "200-399"
    },
    "probe23" = {
      name                                      = "socialappsintegrator-health-probe-01"
      protocol                                  = "Http"
      interval                                  = 30
      timeout                                   = 30
      unhealthy_threshold                       = 3
      pick_host_name_from_backend_http_settings = false
      hostname                                  = "socialappsintegrator.timesprism.com"
      path                                      = "/"
      status_code                               = "200-399"
    },
    "probe24" = {
      name                                      = "solrapps-health-probe-01"
      protocol                                  = "Http"
      interval                                  = 30
      timeout                                   = 30
      unhealthy_threshold                       = 3
      pick_host_name_from_backend_http_settings = false
      hostname                                  = "solrapps.timesprism.com"
      path                                      = "/TOISearchWs/status"
      status_code                               = "200-399"
    },
    "probe25" = {
      name                                      = "minio-health-probe-01"
      protocol                                  = "Https"
      interval                                  = 30
      timeout                                   = 30
      unhealthy_threshold                       = 3
      pick_host_name_from_backend_http_settings = false
      hostname                                  = "minio.timesprism.com"
      path                                      = "/"
      status_code                               = "200-403"
    },
    "probe26" = {
      name                                      = "console-minio-health-probe-01"
      protocol                                  = "Https"
      interval                                  = 30
      timeout                                   = 30
      unhealthy_threshold                       = 3
      pick_host_name_from_backend_http_settings = false
      hostname                                  = "console-minio.timesprism.com"
      path                                      = "/"
      status_code                               = "200-399"
    },
    "probe27" = {
      name                                      = "jcmssolr-health-probe-01"
      protocol                                  = "Http"
      interval                                  = 30
      timeout                                   = 30
      unhealthy_threshold                       = 3
      pick_host_name_from_backend_http_settings = false
      hostname                                  = "jcmssolr.timesprism.com"
      path                                      = "/TOISearchWs/status"
      status_code                               = "200-399"
    },
    "probe28" = {
      name                                      = "services-orion-health-probe-01"
      protocol                                  = "Http"
      interval                                  = 30
      timeout                                   = 30
      unhealthy_threshold                       = 3
      pick_host_name_from_backend_http_settings = false
      hostname                                  = "services-orion.timesprism.com"
      path                                      = "/OrionServices/status"
      status_code                               = "200-399"
    },
    "probe29" = {
      name                                      = "solrdenmark-health-probe-01"
      protocol                                  = "Http"
      interval                                  = 30
      timeout                                   = 30
      unhealthy_threshold                       = 3
      pick_host_name_from_backend_http_settings = false
      hostname                                  = "solrdenmark.timesprism.com"
      path                                      = "/solr/cms/admin/ping?wt=json&q=*:*&distrib=true"
      status_code                               = "200-399"
    },
    # "probe30" = {
    #   name                                      = "tenant-security-health-probe-01"
    #   protocol                                  = "Http"
    #   interval                                  = 30
    #   timeout                                   = 30
    #   unhealthy_threshold                       = 3
    #   pick_host_name_from_backend_http_settings = false
    #   hostname                                  = "tenant-security.timesprism.com"
    #   path                                      = "/"
    # },
    "probe31" = {
      name                                      = "scribbler-health-probe-01"
      protocol                                  = "Http"
      interval                                  = 30
      timeout                                   = 30
      unhealthy_threshold                       = 3
      pick_host_name_from_backend_http_settings = false
      hostname                                  = "scribbler.timesprism.com"
      path                                      = "/healthcheck"
      status_code                               = "200-399"
    },
    "probe32" = {
      name                                      = "stories-health-probe-01"
      protocol                                  = "Http"
      interval                                  = 30
      timeout                                   = 30
      unhealthy_threshold                       = 3
      pick_host_name_from_backend_http_settings = false
      hostname                                  = "stories.timesprism.com"
      path                                      = "/index.html"
      status_code                               = "200-399"
    },
    "probe33" = {
      name                                      = "cloudservices-health-probe-01"
      protocol                                  = "Http"
      interval                                  = 30
      timeout                                   = 30
      unhealthy_threshold                       = 3
      pick_host_name_from_backend_http_settings = false
      hostname                                  = "cloudservices.timesprism.com"
      path                                      = "/"
      status_code                               = "200-399"
    },
    "probe34" = {
      name                                      = "cloudservices-cms-api-health-probe-01"
      protocol                                  = "Http"
      interval                                  = 30
      timeout                                   = 30
      unhealthy_threshold                       = 3
      pick_host_name_from_backend_http_settings = false
      hostname                                  = "cloudservices-cms-api.timesprism.com"
      path                                      = "/cms-api/health"
      status_code                               = "200-399"
    },
    "probe35" = {
      name                                      = "cloudservices-cms-analytics-health-probe-01"
      protocol                                  = "Http"
      interval                                  = 30
      timeout                                   = 30
      unhealthy_threshold                       = 3
      pick_host_name_from_backend_http_settings = false
      hostname                                  = "cloudservices-cms-analytics.timesprism.com"
      path                                      = "/cms-analytics/health"
      status_code                               = "200-399"
    },
    "probe36" = {
      name                                      = "cloudservices-cms-ext-health-probe-01"
      protocol                                  = "Http"
      interval                                  = 30
      timeout                                   = 30
      unhealthy_threshold                       = 3
      pick_host_name_from_backend_http_settings = false
      hostname                                  = "cloudservices-cms-ext.timesprism.com"
      path                                      = "/cms-ext/health"
      status_code                               = "200-399"
    },
    "probe37" = {
      name                                      = "cloudservices-cms-search-health-probe-01"
      protocol                                  = "Http"
      interval                                  = 30
      timeout                                   = 30
      unhealthy_threshold                       = 3
      pick_host_name_from_backend_http_settings = false
      hostname                                  = "cloudservices-cms-search.timesprism.com"
      path                                      = "/cms-search/health"
      status_code                               = "200-399"
    },
    "probe38" = {
      name                                      = "cloudservices-cms-gn-health-probe-01"
      protocol                                  = "Http"
      interval                                  = 30
      timeout                                   = 30
      unhealthy_threshold                       = 3
      pick_host_name_from_backend_http_settings = false
      hostname                                  = "cloudservices-cms-gn.timesprism.com"
      path                                      = "/cms-gn/health"
      status_code                               = "200-399"
    },
    "probe39" = {
      name                                      = "assets-sociowatch-health-probe-01"
      protocol                                  = "Http"
      interval                                  = 30
      timeout                                   = 30
      unhealthy_threshold                       = 3
      pick_host_name_from_backend_http_settings = false
      hostname                                  = "assets.sociowatch.in"
      path                                      = "/health"
      status_code                               = "200-399"
    },
    "probe41" = {
      name                                      = "cms-sociowatch-health-probe-02"
      protocol                                  = "Http"
      interval                                  = 30
      timeout                                   = 30
      unhealthy_threshold                       = 3
      pick_host_name_from_backend_http_settings = false
      hostname                                  = "cms.sociowatch.in"
      path                                      = "/"
      status_code                               = "200-399"
    },
    "probe42" = {
      name                                      = "logs-sociowatch-health-probe-01"
      protocol                                  = "Http"
      interval                                  = 30
      timeout                                   = 30
      unhealthy_threshold                       = 3
      pick_host_name_from_backend_http_settings = false
      hostname                                  = "logs.sociowatch.com"
      path                                      = "/check"
      status_code                               = "200-399"
    },
    "probe43" = {
      name                                      = "stgcms-sociowatch-health-probe-01"
      protocol                                  = "Http"
      interval                                  = 30
      timeout                                   = 30
      unhealthy_threshold                       = 3
      pick_host_name_from_backend_http_settings = false
      hostname                                  = "stgcms.sociowatch.in"
      path                                      = "/"
      status_code                               = "200-399"
    },
    "probe44" = {
      name                                      = "ws-sociowatch-health-probe-01"
      protocol                                  = "Http"
      interval                                  = 30
      timeout                                   = 30
      unhealthy_threshold                       = 3
      pick_host_name_from_backend_http_settings = false
      hostname                                  = "ws.sociowatch.in"
      path                                      = "/health"
      status_code                               = "200-399"
    },
    "probe45" = {
      name                                      = "services-sociowatch-health-probe-01"
      protocol                                  = "Http"
      interval                                  = 30
      timeout                                   = 30
      unhealthy_threshold                       = 3
      pick_host_name_from_backend_http_settings = false
      hostname                                  = "services.sociowatch.in"
      path                                      = "/health"
      status_code                               = "200-399"
    },
    "probe46" = {
      name                                      = "artifacts-timesprism-health-probe-01"
      protocol                                  = "Http"
      interval                                  = 30
      timeout                                   = 30
      unhealthy_threshold                       = 3
      pick_host_name_from_backend_http_settings = false
      hostname                                  = "artifacts.timesprism.com"
      path                                      = "/"
      status_code                               = "200-399"
    },
    "probe47" = {
      name                                      = "monitor-sociowatch-health-probe-01"
      protocol                                  = "Http"
      interval                                  = 30
      timeout                                   = 30
      unhealthy_threshold                       = 3
      pick_host_name_from_backend_http_settings = false
      hostname                                  = "monitor.sociowatch.in"
      path                                      = "/"
      status_code                               = "200-399"
    },
    "probe48" = {
      name                                      = "mediahub-timesprism-health-probe-01"
      protocol                                  = "Http"
      interval                                  = 30
      timeout                                   = 30
      unhealthy_threshold                       = 3
      pick_host_name_from_backend_http_settings = false
      hostname                                  = "mediahub.timesprism.com"
      path                                      = "/healthcheck"
      status_code                               = "200-399"
    },
    "probe49" = {
      name                                      = "mediahubpvt-timesprism-health-probe-01"
      protocol                                  = "Http"
      interval                                  = 30
      timeout                                   = 30
      unhealthy_threshold                       = 3
      pick_host_name_from_backend_http_settings = false
      hostname                                  = "mediahubpvt.timesprism.com"
      path                                      = "/healthcheck"
      status_code                               = "200-399"
    },
  }
  ssl_certificate = {
    "ssl1" = {
      name      = "Timesprism-com-01"
      secret_id = "https://kv-ci-central-prd-shs-01.vault.azure.net/secrets/Timesprism-com-01"
    },
    "ssl2" = {
      name      = "Sociowatch-in-01"
      secret_id = "https://kv-ci-central-prd-shs-01.vault.azure.net/secrets/Sociowatch-in-01"
    },
    "ssl3" = {
      name      = "Sociowatch-com-01"
      secret_id = "https://kv-ci-central-prd-shs-01.vault.azure.net/secrets/Sociowatch-com-01"
    },
  }
}

