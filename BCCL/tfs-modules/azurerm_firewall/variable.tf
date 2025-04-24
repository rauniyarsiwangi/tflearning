
variable "create_resource_group" {
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

variable "pip_name" {
  type    = string
  default = ""
}

variable "fw_sku_name" {
  type    = string
  default = ""
}

variable "fw_sku_tier" {
  type    = string
  default = ""
}

variable "fw_name" {
  type    = string
  default = ""
}

variable "fw_policy_name" {
  type    = string
  default = ""
}

variable "fw_policy_sku" {
  type    = string
  default = ""
}

variable "proxy_enabled" {
  type    = bool
  default = false
}

variable "servers" {
  type    = list(string)
  default = null
}





