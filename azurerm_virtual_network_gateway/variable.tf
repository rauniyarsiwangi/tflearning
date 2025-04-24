variable "location" {
  description = "location of express route"
  type        = string
}

variable "pip_allocation_method" {
  description = "Defines the allocation method for this IP address. Possible values are Static or Dynamic. Defaults to Dynamic"
  type        = string
  default     = "Static"
}

variable "public_ip_sku" {
  description = "The SKU of the Public IP. Accepted values are Basic and Standard. Defaults to Basic"
  type        = string
  default     = "Standard"
}


variable "vng_config" {
  description = "Object type of data for Virtual Network Gateway Configuration"
  type = object({
    name          = string
    type          = string
    sku           = string
    active_active = optional(bool)
    generation    = string
    tags          = map(string)
  })
  # default = {
  #   name          = "vpn_gateway"
  #   sku           = "HighPerformance"
  #   type          = "ExpressRoute"
  #   active_active = false
  #   tags = {
  #     "env" = "dev"
  #   }
  # }
}

variable "tags" {
  description = "The tags to associate with resources"
  type        = any
  default = {
    environment = "prod"
  }
}


variable "vnet_name" {
  description = "gateway subnet route table"
  default     = ""
}

variable "resource_group_name" {
  description = "gateway subnet route table"
  default     = ""
}


# variable "con_config" {
#   description = "Object type of data for Express Route Connection Configuration"
#   type = object({
#     name = string
#     type = string
#   })
#   default = {
#     name = "connections_gw"
#     type = "ExpressRoute"
#   }
# }
