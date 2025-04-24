# Display name of management group
variable "display_name" {
  type        = string
  description = "name of management group"
  default     = "mg-hub"
}

variable "policy" {
  type = map(object({
    name                 = string
    policy_definition_id = string
    description          = string
    display_name         = string
    parameters           = optional(any)
    type                 = optional(any)
    list                 = optional(bool)
  }))
}

# Name of policy
variable "policy_rg" {
  type = map(object({
    name                 = string
    policy_definition_id = string
    description          = string
    display_name         = string
    parameters           = any
    parameters2          = optional(any)
    type                 = optional(any)
    list                 = optional(bool)
  }))
  # default = {
  #   "1" = {
  #     name                 = "A maximum of 3 owners"
  #     description          = "Multi-Factor Authentication (MFA) should be enabled for all subscription accounts with write privileges to prevent a breach of accounts or resources."
  #     policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/4f11b553-d42e-4e3a-89be-32ca364cad4c"
  #     display_name         = "MFA should be enabled for accounts with write permissions on your subscription"
  #   }
  #   "2" = {
  #     name                 = "MFA should be enabled "
  #     policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/9297c21d-2ed6-4474-b48f-163f75654ce3"
  #     description          = "Multi-Factor Authentication (MFA) should be enabled for all subscription accounts with write privileges to prevent a breach of accounts or resources."
  #     display_name         = "MFA should be enabled for accounts with write permissions on your subscription"
  #   }
  # }
  description = "name of policy"
}

