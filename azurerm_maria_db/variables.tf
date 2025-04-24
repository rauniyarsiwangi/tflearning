
variable "location" {
  default     = "Central US"
  description = "Location of resource group"

}
variable "resource_group_name" {
  default     = "my-rg"
  description = "Name of the resource group."
}

variable "create_resource_group" {
  default     = false
  description = "Name of the resource group."
  type        = bool
}

# variable "enable_private_endpoint" {
#   default     = true
#   description = "Name of the resource group."
#   type        = bool
# }

# variable "vnet_name" {
#   type        = string
#   default     = "Test_Vnet"
#   description = "Name of Virtual Network"
# }

variable "administrator_login" {
  type        = string
  default     = "Test_Vnet"
  description = "Name of Virtual Network"
}

variable "administrator_login_password" {
  type        = string
  default     = "Test_Vnet"
  description = "Name of Virtual Network"
}


variable "subnet_name" {
  type        = string
  default     = "mysubnet"
  description = "Name of Subnet"
}

# variable "pvt_dns_zone_name" {
#   type        = string
#   default     = "privatelink.mariadb.database.azure.com"
#   description = "private dns zone name"
# }

# variable "pvt_dns_zone_name_link" {
#   type        = string
#   default     = "vnet-private-zone-link"
#   description = "private dns zone name link"
# }
variable "mariadb_server_name" {
  type        = string
  default     = "mariadb-server-1999"
  description = "maraiadb-Server name"
}

variable "allow_access_to_azure_services" {
  type        = bool
  default     = true
  description = "Allow access to Azure services"
}

variable "firewall_rules" {
  description = "Range of IP addresses to allow firewall connections."
  type = map(object({
    firewall_rule_name = string
    start_ip_address = string
    end_ip_address   = string
  }))
  default = null
}


variable "bkp_retention_days" {
  type        = string
  default     = "7"
  description = "Backup retention days"
}
variable "sku" {
  type        = string
  default     = "GP_Gen5_2"
  description = "Server sku"
}
variable "ser_version" {
  type        = string
  default     = "10.3"
  description = "server version"
}
# variable "vnet_rg_name" {
#   default = ""
#   type    = string
# }

variable "size_mb" {
  default     = 32768
  type        = number
  description = "Maria DB Storage Size  in MB"
}
variable "standby_availability_zone" {
  type        = number
  description = "Maria DB Server Storage Size  in MB"
  default     = 2
}
variable "tags" {
  type        = map(string)
  default     = {}
  description = "A mapping of tags to assign to the resource."
}
variable "server_parameters" {
  description = <<EOF
    Map of configuration options: https://learn.microsoft.com/en-us/azure/postgresql/flexible-server/concepts-server-parameters. Merged with default_server_parameters local:
    ```
    log_bin_trust_function_creators = "ON"
    connect_timeout                 = 60
    interactive_timeout             = 28800
    wait_timeout                    = 28800
    ```
  EOF
  type        = map(string)
  default     = {}
}

variable "databases" {
  type        = map(map(string))
  description = "(Required) The name, collation, and character set of the MySQL database(s). (defaults: charset='utf8', collation='utf8_unicode_ci')"
  default     = {}
}
variable "ssl_enforcement_enabled" {
  description = "Flag to enable/disable SSL enforcement"
  type        = bool
  default     = false # Set the default value based on your requirements
}
