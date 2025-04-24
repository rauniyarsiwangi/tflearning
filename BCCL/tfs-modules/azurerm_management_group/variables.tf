variable "display_name" {
  type        = string
  default     = "mg-hub"
  description = "name of management group"
}

variable "location" {
  type        = any
  default     = null
  description = "Azure region"
}

variable "mi_name" {
  type        = string
  default     = "mgrole_mi"
  description = "name of management group"
}

variable "user_principal_name" {
  type        = string
  default     = null
  description = "user upn"
}

variable "rg_name" {
  type        = any
  default     = null
  description = "name of Resource group"
}

variable "enable_rbac" {
  type        = bool
  description = "enable the RBAC role for MG"
}

variable "existing_user" {
  type        = bool
  default     = true
  description = "existing user name"
}

variable "create_mi" {
  type        = bool
  description = "enable the RBAC role for MG"
  default     = false
}

variable "mg_role" {
  type = map(object({
    role_definition_name = optional(string)
    # principal_id         = optional(string)
  }))
  default     = {}
  description = "RBAC role on management group"
}

variable "subscription_ids" {
  type        = list(string)
  default     = [""]
  description = "subscription to deploy management group"
}

variable "parent_management_group_id" {
  type        = string
  description = "root or parent management group id"
}
