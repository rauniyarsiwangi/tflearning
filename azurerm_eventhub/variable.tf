variable "create_resource_group" {
  type    = bool
  default = false
}

variable "enabled" {
  type    = bool
  default = true
}

variable "auto_inflate_enabled" {
  type    = bool
  default = true
}
variable "resource_group_name" {
  type    = string
  default = ""
}

variable "identity_type" {
  type    = string
  default = "SystemAssigned"
}

variable "storage_account_id" {
  type    = string
  default = "/subscriptions/cb09fa41-a507-434b-ad56-36631453ca78/resourceGroups/rsg-ci-ecom-dev-iny-01/providers/Microsoft.Storage/storageAccounts/staciecomdevinylrs01"
}

variable "blob_container_name" {
  type    = string
  default = "inc-inventoryfeed-data"
}

variable "encoding" {
  type    = string
  default = ""
}

variable "location" {
  type    = string
  default = ""
}

variable "namespace_name" {
  type    = string
  default = ""
}

variable "sku" {
  type    = string
  default = ""
}

variable "capacity" {
  type    = string
  default = ""
}

variable "zone_redundant" {
  type    = bool
  default = false
}

variable "public_network_access_enabled" {
  type    = bool
  default = true
}

variable "event_name" {
  type = map(object({
    name              = string
    partition_count   = number
    message_retention = number
    event_status      = optional(string)
  }))
  default = {}
}

variable "minimum_tls_version" {
  type    = string
  default = ""
}
variable "tags" {
  type = any
}
