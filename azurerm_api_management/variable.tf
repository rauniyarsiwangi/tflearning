variable "create_resource_group" {
  type    = bool
  default = false
}

variable "public_network_access_enabled" {
  type    = bool
  default = false
}
variable "resource_group_name" {
  type    = string
  default = ""
}

variable "location" {
  type    = string
  default = ""
}

variable "vnet_name" {
  type    = string
  default = ""
}

variable "subnet_name" {
  type    = string
  default = ""
}

variable "vnet_rg_name" {
  type    = string
  default = ""
}

variable "api_name" {
  type    = string
  default = ""
}

variable "publisher_name" {
  type    = string
  default = ""
}
variable "publisher_email" {
  type    = string
  default = ""
}

variable "sku" {
  type    = string
  default = ""
}

variable "virtual_network_type" {
  type    = string
  default = ""
}

variable "zones" {
  description = "A collection of availability zones to spread the Application Gateway over."
  type        = list(string)
  default     = null
}

variable "pip_name" {
  type    = string
  default = ""
}

variable "pip_rg_name" {
  type    = string
  default = ""
}

# variable "private_ip_addresses" {
#   description = "A collection of availability zones to spread the Application Gateway over."
#   type        = list(string)
#   default     = null
# }

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = any
}
