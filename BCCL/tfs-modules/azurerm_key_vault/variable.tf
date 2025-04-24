variable "kv_rg_name" {
  type    = string
  default = "oyopay"
}
variable "location" {
  type    = string
  default = "central india"
}

variable "kv_devops" {
  description = "Prefix is the naming convention we follows"
  type        = any
}


variable "kv_sku_name" {
  description = "Prefix is the naming convention we follows"
  type        = string
  default     = "standard"
}

variable "kv_name" {
  description = "Prefix is the naming convention we follows"
  type        = string
}

variable "soft_delete_retention_days" {
  description = "Prefix is the naming convention we follows"
  type        = number
  default     = 7
}
variable "tags" {
  description = "Tags to apply to all resources created."
  type        = map(string)
}

variable "enabled_for_deployment" {
  type    = bool
  default = true
}

variable "purge_protection_enabled" {
  type    = bool
  default = false
}

variable "enabled_for_disk_encryption" {
  type    = bool
  default = true
}

variable "enabled_for_template_deployment" {
  type    = bool
  default = true
}
