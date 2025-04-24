variable "display_name" {
  type        = string
  default     = "mg-hub"
  description = "name of management group"
}

variable "subscription_ids" {
  type        = list(string)
  default     = [""]
  description = "subscription to deploy management group"
}

variable "parent_management_group_id" {
  type        = string
  default     = "mg-hub"
  description = "root or parent management group id"
}

variable "principal_id" {
  type    = string
  default = "a277df86-6b53-4162-a3ed-c98a90d5b81e"
}
