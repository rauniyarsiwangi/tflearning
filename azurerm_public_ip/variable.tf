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

variable "pip_name" {
  type    = string
  default = ""
}

variable "allocation_method" {
  type    = string
  default = ""
}

# variable "sku" {
#   type    = string
#   default = ""
# }

variable "tags" {
  type = any
}