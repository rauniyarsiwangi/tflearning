
variable "location" {
  type        = string
  default     = "eastus"
  description = "location"
}

variable "hub_vnet_name" {
  type        = string
  default     = "test-vnet"
  description = "vnet-name"
}

variable "hub_vnet_resource_group_name" {
  type        = string
  default     = "test-rg"
  description = "vnet-resource-group"
}

variable "spoke_vnet_name" {
  type        = string
  default     = "test-vnet"
  description = "vnet-name"
}
 

variable "spoke_vnet_resource_group_name" {
  type        = string
  default     = "test-rg"
  description = "vnet-resource-group"
}


variable "allow_gateway_transit" {
  type    = bool
  default = true
}

variable "allow_virtual_network_access" {
  type    = bool
  default = true
}
variable "allow_forwarded_traffic" {
  type    = bool
  default = true
}

variable "use_remote_gateways" {
  type    = bool
  default = true
}
