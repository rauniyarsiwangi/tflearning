variable "location" {
  type        = string
  default     = "East US"
  description = "Location of resource group"

}
variable "resource_group_name" {
  type        = string
  default     = ""
  description = "Name of the resource group."
}

variable "create_resource_group" {
  default     = false
  description = "Name of the resource group."
  type        = bool
}

variable "tags" {
  description = "The tags to associate with resources"
  type        = any
  default = {
    environment = "test"
  }
}

variable "eventgrid_topic_name" {
  type    = string
  default = ""
}

variable "resource_id" {
  type    = string
  default = ""
}

variable "storage_account_name" {
  type    = string
  default = ""
}
variable "storage_rg_name" {
  type    = string
  default = ""
}
variable "topic_type" {
  type    = string
  default = ""
}

