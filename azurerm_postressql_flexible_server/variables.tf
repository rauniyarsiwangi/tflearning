variable "create_resource_group" {
  type        = bool
  description = "Whether to create resource group and use it for all networking resources"
  default     = false
}

variable "resource_group_location" {
  default     = "eastus"
  description = "Location of the resource group."
}

variable "resource_group_name_prefix" {
  default     = "rg"
  description = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
}

variable "resource_group_name" {
  default     = "my-rg"
  type        = string
  description = "Name of the resource group."
}

variable "vnet_name" {
  type        = string
  default     = "Demo"
  description = "Name of Virtual Network"
}

variable "subnet_name" {
  type        = string
  default     = "mysubnet"
  description = "Name of Subnet"
}


variable "mypostgre_fs_name" {
  type        = string
  default     = "postgresqlfs-demo"
  description = "postgre sql flexible server name"
}

variable "bkp_retention_days" {
  type        = string
  default     = "7"
  description = "Backup retention days"
}

variable "sku" {
  type        = string
  default     = "GP_Standard_D2s_v3"
  description = "Server sku"
}

variable "server_ver" {
  type        = string
  default     = "13"
  description = "server version"
}

variable "server_zone" {
  type        = string
  default     = "1"
  description = "zones"
}


variable "size_mb" {
  type        = number
  description = "PSQL Felxible Server Storage Size  in MB"
}


variable "tags" {
  type        = map(string)
  default     = {}
  description = "A mapping of tags to assign to the resource."
}

variable "server_parameters_default" {
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

variable "server_parameters_variable" {
  type = map(string)
  default = {}
}

variable "databases" {
  type        = map(map(string))
  description = "(Required) The name, collation, and character set of the MySQL database(s). (defaults: charset='utf8', collation='utf8_unicode_ci')"
}

variable "admin_username" {
  type        = string
  default     = "my-rg"
  description = "admin username"
}

variable "admin_password" {
  type        = string
  default     = ""
  description = "admin password"
}

variable "vnet_rg_name" {
  type        = string
  default     = "oyo-vnet"
  description = "virtual network"
}
