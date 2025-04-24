variable "create_resource_group" {
  type    = bool
  default = false
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "tags" {
  type = any
}

variable "natgw_name" {
  type = string
}

variable "sku_name" {
  type = string
}

variable "idle_timeout_in_minutes" {
  type    = number
  default = 4
}

variable "zones" {
  type    = list(string)
  default = []
}


variable "create_pip" {
  type    = bool
  default = false
}

variable "create_pip_prefix" {
  type    = bool
  default = false
}

variable "subnet_association" {
  type    = bool
  default = false
}

variable "pip_config" {
  type = map(object({
    name                    = string
    allocation_method       = string
    zones                   = optional(list(string))
    domain_name_label       = optional(string)
    idle_timeout_in_minutes = optional(number)
    sku                     = optional(string)
    sku_tier                = optional(string)
  }))
  default = null
}

variable "pip_prefix_config" {
  type = map(object({
    name          = string
    prefix_length = optional(number)
    zones         = optional(list(string))
    sku           = optional(string)
  }))
}

variable "subnets" {
  type = map(object({
    subnet_name  = string
    vnet_name    = string
    vnet_rg_name = string
  }))
}
