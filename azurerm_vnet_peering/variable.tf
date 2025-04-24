
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

variable "dest_sub_id" {
  type        = string
  default     = ""
  description = "destinaton vnet subscription id"
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

variable "use_remote_gateways" {
  type    = bool
  default = true
}


variable "allow_gateway_transit" {
  type    = bool
  default = true
}

variable "clientid" {
  type    = string
  default = ""
}

variable "clientsecret" {
  type    = string
  default = ""
}

variable "tenantid" {
  type    = string
  default = ""
}
