variable "resource_group_name" {
  type    = string
  default = ""
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

variable "pip_allocation_method" {
  type    = string
  default = ""
}

variable "pip_name" {
  type    = string
  default = ""
}
