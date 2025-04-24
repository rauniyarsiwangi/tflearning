variable "create_resource_group" {
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

variable "managed_disk_name" {
  type    = string
  default = ""
}

variable "managed_disk_rg" {
  type    = string
  default = ""
}

variable "snapshot_name" {
  type    = string
  default = ""
}

variable "existing_data_disk" {
  type    = bool
  default = false
}

variable "dd_config" {
  type = map(object({
    name                = string
    resource_group_name = string
    dd_name             = string
  }))
  default = {}
}

variable "source_sub_id" {
  type    = string
  default = ""
}

variable "dest_sub_id" {
  type    = string
  default = "0a62a07b-1587-4006-8553-9e7656edb988"
}
