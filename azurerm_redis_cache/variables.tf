variable "create_resource_group" {
  description = "Whether to create resource group and use it for all networking resources"
  default     = true
}

variable "resource_group_name" {
  description = "A container that holds related resources for an Azure solution"
  default     = ""
}

variable "location" {
  description = "The location/region to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'"
  default     = ""
}

# variable "log_analytics_workspace_name" {
#   description = "The name of log analytics workspace name"
#   default     = null
# }

variable "redis_instance_name" {
  description = "The name of the Redis instance"
  default     = ""
}

# variable "storage_account_name" {
#   description = "The name of the Redis instance"
#   default     = "test19628"
# }

# variable "stg_rg_name" {
#   description = "The name of the Redis instance"
#   default     = "Test-1"
# }


variable "redis_family" {
  type        = map(any)
  description = "The SKU family/pricing group to use. Valid values are `C` (for `Basic/Standard` SKU family) and `P` (for `Premium`)"
  default = {
    Basic    = "C"
    Standard = "C"
    Premium  = "P"
  }
}

variable "redis_server_settings" {
  type = object({
    name                          = string
    capacity                      = number
    family                        = string
    sku_name                      = string
    redis_version                 = number
    enable_non_ssl_port           = optional(bool)
    minimum_tls_version           = optional(string)
    public_network_access_enabled = optional(bool)
    replicas_per_master           = optional(number)
    shard_count                   = optional(number)
    zones                         = optional(list(string))
  })
  description = "optional redis server setttings for both Premium and Standard/Basic SKU"
  default     = null
}

variable "patch_schedule" {
  type = object({
    day_of_week    = string
    start_hour_utc = number
  })
  description = "The window for redis maintenance. The Patch Window lasts for 5 hours from the `start_hour_utc` "
  default     = null
}

# variable "subnet_id" {
#   description = "The ID of the Subnet within which the Redis Cache should be deployed. Only available when using the Premium SKU"
#   default     = null
# }

variable "redis_configuration" {
  type = object({
    enable_authentication           = optional(bool)
    maxfragmentationmemory_reserved = optional(number)
    maxmemory_delta                 = optional(number)
    maxmemory_policy                = optional(string)
    maxmemory_reserved              = optional(number)
    notify_keyspace_events          = optional(string)
    rdb_backup_enabled              = optional(bool)
    rdb_backup_frequency            = optional(number)
    rdb_backup_max_snapshot_count   = optional(number)
    rdb_storage_connection_string   = optional(string)
  })
  description = "Configuration for the Redis instance"
  default = null
}


variable "enable_data_persistence" {
  description = "Enable or disbale Redis Database Backup. Only supported on Premium SKU's"
  default     = false
}

variable "data_persistence_backup_frequency" {
  description = "The Backup Frequency in Minutes. Only supported on Premium SKU's. Possible values are: `15`, `30`, `60`, `360`, `720` and `1440`"
  default     = 1440
}

variable "data_persistence_backup_max_snapshot_count" {
  description = "The maximum number of snapshots to create as a backup. Only supported for Premium SKU's"
  default     = 1
}

variable "firewall_rules" {
  description = "Range of IP addresses to allow firewall connections."
  type = map(object({
    start_ip = string
    end_ip   = string
  }))
  default = null
}

# variable "enable_private_endpoint" {
#   description = "Manages a Private Endpoint to Azure database for Redis"
#   type        = bool
#   default     = true
# }

# variable "virtual_network_name" {
#   description = "The name of the virtual network"
#   default     = ""
# }

# variable "dns_record" {
#   description = "The name of the virtual network"
#   type        = string
#   default     = ""
# }

# variable "existing_private_dns_zone" {
#   description = "Name of the existing private DNS zone"
#   default     = null
# }

# variable "private_subnet_address_prefix" {
#   description = "The name of the subnet for private endpoints"
#   default     = null
# }

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

# variable "subnet_name" {
#   description = "Name of the Subnet"
#   type        = string
#   default     = ""
# }

# variable "vnet_rg_name" {
#   description = "Name of VNET RG NAME"
#   type        = string
#   default     = ""
# }

# variable "vnet_name" {
#   description = "Name of the VNET Name"
#   type        = string
#   default     = ""
# }

# variable "pe_resource_name" {
#   description = "private endpoint name"
#   type        = string
#   default     = ""
# }

# variable "pse_resource_name" {
#   description = "name of private service connection"
#   type        = string
#   default     = ""
# }

# variable "pvt_dns_zone_name" {
#   description = "private dns zone name"
#   type        = string
#   default     = ""
# }

# variable "pvt_rg_name" {
#   description = "private endpoint name"
#   type        = string
#   default     = ""
# }

# variable "storage_account_id" {
#   description = "Id of the storage"
#   type        = string
# }

# variable "logs" {
#   description = "Logs that needs to be enabled"
#   type = list(object({
#     name           = string,
#     enabled        = bool,
#     retention_days = optional(number),
#   }))
#   default = [
#     {
#       name           = "AuditEvent",
#       enabled        = false,
#       retention_days = 0,
#     }
#   ]
# }

# variable "metrics" {
#   description = "metrics that needs to be enabled"
#   type = list(object({
#     name           = optional(string),
#     enabled        = optional(bool),
#     retention_days = optional(number),
#   }))
#   default = [
#     {
#       name           = "AllMetrics",
#       enabled        = false,
#       retention_days = 0,
#     }
#   ]
# }
