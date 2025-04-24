variable "create_resource_group" {
  type    = bool
  default = false
}


variable "attach_subnet" {
  type    = bool
  default = false
}

# variable "attach_nat" {
#   type    = bool
#   default = false
# }


variable "resource_group_name" {
  type    = string
  default = ""
}

variable "private_subnet_name" {
  type    = string
  default = ""
}
variable "public_subnet_name" {
  type    = string
  default = ""
}

variable "vnet_name" {
  type    = string
  default = "test-vnet"
}

variable "vnet_rg_name" {
  type    = string
  default = "default"
}

variable "location" {
  type    = string
  default = ""
}


variable "databricks_name" {
  type    = string
  default = ""
}


variable "sku" {
  type    = string
  default = ""
}


variable "tags" {
  type = any
}

variable "custom_parameters" {
  type = map(object({
    virtual_network_id                                   = optional(string)
    public_ip_name                                       = optional(string)
    private_subnet_name                                  = optional(string)
    public_subnet_name                                   = optional(string)
    no_public_ip                                         = optional(bool)
    nat_gateway_name                                     = optional(string)
    public_subnet_network_security_group_association_id  = optional(string)
    private_subnet_network_security_group_association_id = optional(string)
  }))
  default = {}
}
