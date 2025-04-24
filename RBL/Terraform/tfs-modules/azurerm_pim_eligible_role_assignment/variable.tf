variable "role_name" {
  description = "RBAC Role for PIM User"
  type        = string
  default     = "Reader"
}

variable "principal_id" {
  description = "User principle id"
  type        = string
  default     = "e3e040f2-2d80-4600-8b33-e353ea58bc91"
}

variable "duration_hours" {
  description = "Total hours of duration in number"
  type        = number
  default     = 8
}

variable "justification" {
  description = "User principle id"
  type        = string
  default     = "permission to access the resource"
}

variable "start_date_time" {
  description = "User principle id"
  type        = any
  default     = null
}
