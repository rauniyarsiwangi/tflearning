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
  default     = "Australia East"
}

variable "log_name" {
  type        = string
  default     = "Australia East"
}

variable "retention_in_days" {
  type        = string
  default     = "Australia East"
}

variable "log_sku" {
  type        = string
  default     = "Australia East"
}

variable "env_name" {
  type        = string
  default     = "Australia East"
}

variable "container_name" {
  type        = string
  default     = "Australia East"
}


variable "revision_mode" {
  type        = string
  default     = "Australia East"
}

variable "image_name" {
  type        = string
  default     = "Australia East"
}

variable "image_id" {
  type        = string
  default     = "mcr.microsoft.com/azuredocs/containerapps-helloworld:latest"

}

variable "conatiner_cpu" {
  type        = string
}

variable "container_memory" {
    type        = string
}


