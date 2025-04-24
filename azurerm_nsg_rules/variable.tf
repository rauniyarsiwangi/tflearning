
variable "nsg_config" {
  type = map(object({
    name                         = string
    priority                     = string
    direction                    = string
    access                       = string
    protocol                     = string
    source_port_range            = optional(string)
    destination_port_range       = optional(string)
    source_address_prefix        = optional(string)
    destination_address_prefix   = optional(string)
    source_port_ranges           = optional(list(string))
    destination_port_ranges      = optional(list(string))
    source_address_prefixes      = optional(list(string))
    destination_address_prefixes = optional(list(string))
  }))
}


variable "nsg_name" {
  type    = string
  default = ""
}

variable "resource_group_name" {
  type    = string
  default = ""
}
