variable "resource_group_name" {
  type        = string
  description = "Specifies the parent resource group name."
  default     = ""
}

variable "create_resource_group" {
  type        = bool
  default     = "false"
  description = "bool type of data to create resource group."
}

variable "location" {
  type        = string

}

variable "profile_name" {
  type        = string

}

variable "profile_sku" {
  type        = string

}

variable "response_timeout_seconds" {
  type        = string

}


variable "tags" {
  type = any
}