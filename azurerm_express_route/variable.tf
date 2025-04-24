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

variable "er_config" {
  description = "Object type of data for Express Route Configuration"
  type = object({
    name                     = string
    service_provider_name    = string
    peering_location         = string
    bandwidth_in_mbps        = number
    allow_classic_operations = optional(bool)
    tags                     = map(string)
  })
  default = {
    bandwidth_in_mbps        = 1
    name                     = "er_gatway"
    peering_location         = "Silicon Valley"
    service_provider_name    = "AT&T Netbond"
    allow_classic_operations = false
    tags = {
      "env" = "dev"
    }
  }
}

variable "sku" {
  description = "SKU For express Route"
  type = object({
    tier   = string
    family = string
  })
  default = {
    family = "MeteredData"
    tier   = "Standard"
  }
}

variable "vng_config" {
  description = "Object type of data for Virtual Network Gateway Configuration"
  type = object({
    name          = string
    type          = string
    sku           = string
    active_active = optional(bool)
    tags          = map(string)
  })
  default = {
    name          = "vpn_gateway"
    sku           = "HighPerformance"
    type          = "ExpressRoute"
    active_active = false
    tags = {
      "env" = "dev"
    }
  }
}

variable "con_config" {
  description = "Object type of data for Express Route Connection Configuration"
  type = object({
    name = string
    type = string
  })
  default = {
    name = "connections_gw"
    type = "ExpressRoute"
  }
}

variable "tags" {
  description = "The tags to associate with resources"
  type        = any
  default = {
    environment = "prod"
  }
}

variable "gateway_subnet" {
  description = "azure gateway subnet"
  type        = list(string)
  default     = ["10.15.41.192/27"]
}

variable "route_table_name" {
  description = "gateway subnet route table"
  default     = "rtb-ci-inf-prd-gw-01"
}

variable "vnet_name" {
  description = "gateway subnet route table"
  default     = "vnt-ci-inf-prd-01"
}

variable "resource_group_name" {
  description = "gateway subnet route table"
  default     = "rsg-ci-inf-prd-net-01"
}
