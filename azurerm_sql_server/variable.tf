variable "create_resource_group" {
  type    = bool
  default = false
}

variable "resource_group_name" {
  type    = string
  default = ""
}

variable "custom_network_interface_name" {
  type    = string
  default = ""
}

variable "location" {
  type    = string
  default = ""
}

variable "pvt_dns_id" {
  type    = list(string)
  default = ["/subscriptions/4a62f632-6f6b-472f-8968-6574375e4ced/resourceGroups/rsg-ci-store-dev-net-01/providers/Microsoft.Network/privateDnsZones/database.windows.net"]
}

variable "ipconfig" {
  type    = string
  default = ""
}

variable "psc_name" {
  type    = string
  default = ""
}


variable "server_name" {
  type    = string
  default = ""
}

variable "server_ver" {
  type    = string
  default = ""
}

variable "admin_username" {
  type    = string
  default = ""
}

variable "admin_password" {
  type    = string
  default = ""
}
variable "tags" {
  type    = any
  default = {}
}

variable "firewall_rules" {
  type = map(object({
    name             = string
    start_ip_address = string
    end_ip_address   = string
  }))
  default = {}
}

variable "database" {
  type = map(object({
    name                 = string
    collation            = optional(string)
    sku_name             = optional(string)
    zone_redundant       = optional(bool)
    storage_account_type = optional(string)
    max_size_gb          = optional(number)
  }))
  default = {}
}

variable "create_database" {
  type    = bool
  default = false
}

variable "user_name" {
  type    = string
  default = ""
}

variable "object_id" {
  type    = string
  default = ""
}

variable "use_system_assigned_identity" {
  type    = bool
  default = true
}

variable "ad_admin_enabled" {
  type    = bool
  default = true
}

variable "minimum_tls_version" {
  type    = string
  default = ""
}

variable "private_ip_address" {
  type    = string
  default = ""
}



variable "private_endpoint_enabled" {
  description = "Enable or disable private endpoint"
  type        = bool
  default     = false
}

variable "private_endpoint_subnet_id" {
  description = "The ID of the subnet for the private endpoint"
  type        = string
  default     = ""
}

# variable "vnet_integration_enabled" {
#   description = "Enable or disable VNet integration"
#   type        = bool
#   default     = false
# }

# variable "vnets" {
#   type = map(object({
#     name                 = string
#     # virtual_network_name = string
#     subnet_id            = string
#   }))
#   default = {}
# }

# variable "existing_sub_id" {
#   type = string
#   default = "value"
# }
