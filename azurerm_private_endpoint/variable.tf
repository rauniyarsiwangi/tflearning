variable "create_resource_group" {
  type    = bool
  default = false
}

variable "is_manual_connection" {
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

variable "pe_resource_name" {
  type    = string
  default = ""
}

variable "ip_configuration_name" {
  type    = string
  default = ""
}

variable "private_ip_address" {
  type    = string
  default = ""
}

variable "pse_resource_name" {
  type    = string
  default = ""
}

variable "endpoint_resource_id" {
  type    = string
  default = ""
}

variable "subresource_names" {
  description = "The name of the subresource that the new Private Endpoint will be assigned to."
  type        = list(string)
}

variable "subnet_name" {
  description = "Subnet Name"
  type        = string
  default     = ""
}

variable "vnet_rg_name" {
  description = "VNET RG NAME"
  type        = string
  default     = ""
}

variable "vnet_name" {
  description = "VNET Name"
  type        = string
  default     = ""
}
variable "custom_network_interface_name" {
  description = "NIC Name"
  type        = string
  default     = ""
}
variable "tags" {
  description = "Tags to apply to all resources created."
  type        = map(string)
  default     = {}
}
