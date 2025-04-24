variable "create_resource_group" {
  type    = bool
  default = false
}

variable "location" {
  type        = string
  description = "Location of the load balancer, use the RG's location if not set"
  default     = ""
}

# variable "type" {
#   type    = string
#   default = "public"
# }

variable "resource_group_name" {
  type        = string
  description = "Resource group name of the load balancer."
  default     = ""
}

variable "subnet_name" {
  type        = string
  description = "Subnet list"
  default     = ""
}

variable "vnet_name" {
  type        = string
  description = "vnet list"
  default     = ""
}

variable "vnet_rg_name" {
  type        = string
  description = "vnet_rg_name"
  default     = ""
}

# variable "pip" {
#   type    = any
#   default = {}
# }
# variable "create_public_ip" {
#   type    = bool
#   default = false
# }

# variable "pip_name" {
#   type        = string
#   description = "Public ip name"
#   default     = ""
# }

variable "sku" {
  type        = string
  description = "Public ip name"
  default     = ""
}

variable "allocation_method" {
  type        = string
  description = "allocation_method"
  default     = ""
}

variable "frontend_ip_configuration" {
  type = map(object({
    name                          = string
    private_ip_address            = optional(string)
    private_ip_address_allocation = optional(string)
    private_ip_address_version    = optional(string)
    public_ip_address_id          = optional(string)
  }))
}

variable "backend_pool" {
  type = map(object({
    name = string
  }))
}

variable "lb_probe" {
  type = map(object({
    name                = string
    probe_port          = string
    protocol            = string
    request_path        = optional(string)
    interval_in_seconds = optional(string)
  }))
}

variable "lb" {
  type    = any
  default = {}
}

variable "lb_name" {
  type    = string
  default = ""
}

variable "lb_sku" {
  type    = string
  default = ""
}

variable "type" {
  type    = string
  default = "public"
}

variable "LbRules" {
  type = map(object({
    name                           = string
    protocol                       = string
    frontend_port                  = string
    backend_port                   = string
    frontend_ip_configuration_name = string
    poolkey                        = string
    load_distribution              = optional(string)
    probekey                       = string
  }))
}

variable "create_outbound_rule" {
  type    = bool
  default = false
}

variable "create_lb_rule" {
  type    = bool
  default = false
}

variable "outbound_rule" {
  type = map(object({
    name     = string
    protocol = string
    poolkey  = string
  }))
  default = {}
}

variable "create_lb_nat_rule" {
  type    = bool
  default = false
}

variable "lb_nat_rule" {
  type = map(object({
    name                           = string
    protocol                       = string
    frontend_port_start            = string
    frontend_port_end              = string
    backend_port                   = string
    poolkey                        = string
    frontend_ip_configuration_name = string
  }))
  default = {}
}
variable "tags" {
  type    = any
  default = {}
}
