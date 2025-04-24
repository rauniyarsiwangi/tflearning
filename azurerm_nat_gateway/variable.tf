variable "create_resource_group" {
  type    = bool
  default = false
}

variable "create_pip_prefix" {
  type    = bool
  default = false
}

variable "create_public_ip" {
  type    = bool
  default = false
}

variable "subnet_association" {
  type    = bool
  default = false
}

variable "resource_group_name" {
  description = "Name of the Resource Group"
  type        = string
  default     = ""
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "A mapping of tags to assign to the resource."
}

variable "location" {
  description = "Location"
  type        = string
  default     = ""
}

variable "pip" {
  type = map(object({
    name = string
    sku  = string
  }))
  default = {}
}

variable "nat_gw_name" {
  description = "NAT Gateway Public IP"
  type        = string
  default     = ""
}

variable "pip_prefix" {
  type = map(object({
    name          = string
    prefix_length = number
    zones         = string
  }))
  default = {}
}

# variable "prefix_length" {
#   description = "Public IP prefix name"
#   type        = number
#   default     = 30
# }

variable "idle_timeout_in_minutes" {
  description = "Public IP prefix name"
  type        = number
  default     = 10
}


variable "sku_name" {
  description = "Public IP prefix name"
  type        = string
  default     = ""
}

variable "subnets" {
  type = map(object({
    name                 = string
    resource_group_name  = string
    virtual_network_name = string
  }))
  default = {}
}




