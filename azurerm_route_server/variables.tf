
variable "create_resource_group" {
  type    = bool
  default = false
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region where resources will be provisioned"
  type        = string
  default     = "East US"
}

variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
}

variable "vnet_rg_name" {
  description = "Name of the resource group"
  type        = string
}


variable "public_ip_name" {
  description = "Name of the public IP"
  type        = string
}

variable "route_server_name" {
  description = "Name of the Azure Route Server"
  type        = string
}

variable "subnet_address_prefixes" {
  description = "Name of the Azure Route Server"
  type        = list(string)
}

variable "route_server_sku" {
  description = "Name of the Azure Route Server"
  type        = string
  default     = "Standard"
}
