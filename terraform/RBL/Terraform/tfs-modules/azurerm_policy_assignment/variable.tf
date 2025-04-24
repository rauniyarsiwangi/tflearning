variable "assignment_scope" {
  type = string
}

variable "enable_identity" {
  type    = bool
  default = false
}

variable "mg_name" {
  type    = any
  default = null
}

# variable "role_definition_name" {
#   type    = string
#   default = null
# }

variable "rg_name" {
  type    = any
  default = null
}

variable "resource_id" {
  type    = any
  default = null
}

# variable "policy_rem_config" {
#   type = map(object({
#     name                 = string
#     location_filters     = optional(list(string))
#     failure_percentage   = optional(string)
#     parallel_deployments = optional(bool)
#     resource_count       = optional(bool)
#   }))
# }

variable "policy_def_config" {
  type = map(object({
    name                 = string
    policy_definition_id = string
    display_name         = optional(string)
    description          = optional(string)
    parameters           = optional(any)
    metadata             = optional(any)
    not_scopes           = optional(list(any))
    enforce              = optional(bool)
    location             = string
    type                 = optional(string)
  }))
}

