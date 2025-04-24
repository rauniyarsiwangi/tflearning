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

variable "app_name" {
  type    = string
  default = ""
}

variable "enabled" {
  type    = bool
  default = false
}

variable "workflow_version" {
  type    = string
  default = ""
}

variable "tags" {
  description = "The tags to associate with resources"
  type        = any
  default = {
    environment = "test"
  }
}
