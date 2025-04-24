variable "backend_address_pools" {
  description = "List of backend address pool objects"
  type = map(object({
    name         = string
    ip_addresses = list(string)
  }))
}

variable "frontend_ports" {
  description = "List of frontendports"
  type = map(object({
    name = string
    port = string
  }))
  default = null
}

variable "listeners" {
  description = "List of HTTPS listener objects"
  type = map(object({
    name                           = string
    frontend_ip_configuration_name = string
    frontend_port_name             = string
    protocol                       = string
    host_name                      = optional(string)
    host_names                     = optional(list(string))
    ssl_certificate_name           = optional(string)
    require_sni                    = optional(bool)
  }))
  default = null
}

variable "probes" {
  description = "List of probe objects"
  type = map(object({
    name                = string
    hostname            = string
    protocol            = string
    port                = optional(number)
    path                = string
    interval            = number
    timeout             = number
    unhealthy_threshold = number
    minimum_servers     = optional(number)
    status_code         = optional(string)
  }))
  default = null
}

variable "backend_http_settings" {
  description = "List of backend HTTP settings objects"
  type = map(object({
    name            = string
    port            = number
    protocol        = string
    request_timeout = optional(string)
    probe_name      = optional(string)
  }))
  default = null
}

variable "request_routing_rules" {
  description = "List of request routing rule objects"
  type = map(object({
    name                        = string
    priority                    = number
    rule_type                   = string
    http_listener_name          = string
    backend_address_pool_name   = optional(string)
    backend_http_settings_name  = optional(string)
    redirect_configuration_name = optional(string)
    url_path_map_name           = optional(string)
  }))
  default = null
}

variable "url_path_maps" {
  description = "List of URL path map objects"
  type = map(object({
    name                                = string
    default_backend_address_pool_name   = string
    default_backend_http_settings_name  = string
    default_redirect_configuration_name = optional(string)
    path_rule = map(object({
      name                        = string
      backend_address_pool_name   = optional(string)
      backend_http_settings_name  = optional(string)
      paths                       = list(string)
      redirect_configuration_name = optional(string)
    }))
  }))
  default = null
}

variable "redirect_configuration" {
  description = "Redirect configuration object"
  type = map(object({
    name                 = string
    redirect_type        = string
    target_listener_name = string
    target_url           = optional(string)
    include_path         = optional(bool)
    include_query_string = optional(bool)
  }))
  default = null
}


variable "ssl_certificate" {
  description = "ssl_certificate"
  type = map(object({
    name      = any
    password  = optional(string)
    secret_id = optional(string)
  }))
  default = null
}

variable "enable_http2" {
  type    = bool
  default = false
}

variable "create_resource_group" {
  type    = bool
  default = false
}

variable "enable_https_rule" {
  type    = bool
  default = true
}

variable "resource_group_name" {
  type    = string
  default = ""
}

# variable "min_protocol_version" {
#   type    = string
#   default = "TLSv1_2"
# }

variable "user_assigned_identity" {
  type    = string
  default = "mi-ci-central-prd-shs-01"
}

variable "zones" {
  type    = list(string)
  default = null
}

variable "urlpaths" {
  type    = list(string)
  default = ["urlpath10", "urlpath1"]
}

variable "pip_sku" {
  type    = string
  default = "Standard"
}

variable "location" {
  type    = string
  default = "Central india"
}

variable "routing_preference" {
  type    = string
  default = "Microsoft"
}

variable "frontend_ip_configuration_name" {
  type    = string
  default = ""
}


variable "gateway_ip_configuration_name" {
  type    = string
  default = ""
}

variable "appgw_name" {
  type    = string
  default = ""
}

variable "sku_name" {
  type    = string
  default = ""
}

variable "sku_tier" {
  type    = string
  default = ""
}

variable "sku_capacity" {
  type    = string
  default = ""
}

variable "pip_name" {
  type    = string
  default = ""
}

variable "private_ip_address" {
  type    = string
  default = ""
}

variable "key_vault_secret_id" {
  type      = string
  default   = ""
  sensitive = true
}

variable "app_type" {
  type    = string
  default = "Public"
}

# variable "pip_allocation_method" {
#   type    = string
#   default = ""
# }

variable "subnet_name" {
  type    = string
  default = ""
}
variable "vnet_rg_name" {
  type    = string
  default = ""
}
variable "virtual_network_name" {
  type    = string
  default = ""
}

variable "kv_name" {
  type    = string
  default = null
}

variable "kv_rg_name" {
  type    = string
  default = null
}

variable "akv_cert_name" {
  type    = string
  default = null
}

# variable "akv_cert_names" {
#   type = list(string)
#   default = ["Timesprism-com-01", "Sociowatch-com-01", "Sociowatch-in-01"]
# }

variable "waf_config" {
  type = object({
    enabled          = bool
    firewall_mode    = string
    rule_set_type    = optional(string)
    rule_set_version = string
  })
  default = null
}
