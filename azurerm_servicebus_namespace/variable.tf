variable "create_resource_group" {
  type    = bool
  default = false
}

variable "attach_queue" {
  type    = bool
  default = false
}

variable "attach_topic" {
  type    = bool
  default = false
}

variable "dead_lettering_on_message_expiration" {
  type    = bool
  default = true
}

variable "attach_subscription" {
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

variable "servicebus" {
  type = object({
    name                = string
    sku                 = string
    capacity            = optional(string)
    local_auth_enabled  = optional(bool)
    zone_redundant      = optional(bool)
    minimum_tls_version = optional(string)
  })
}

variable "tags" {
  type = any
}

variable "queue" {
  type = map(object({
    name                  = string
    enable_partitioning   = bool
    max_size_in_megabytes = optional(string)
    status                = optional(string)
    max_delivery_count    = optional(number)
    lock_duration         = optional(string)
    auto_delete_on_idle   = optional(string)
    default_message_ttl = optional(string)
    requires_duplicate_detection = optional(bool)
    duplicate_detection_history_time_window = optional(string)
  }))
  default = {}
}


variable "topic" {
  type = map(object({
    name                         = string
    enable_partitioning          = bool
    max_size_in_megabytes         = optional(string)
    # max_message_size_in_kilobytes = optional(string)
    status                       = optional(string)
    auto_delete_on_idle          = optional(string)
    default_message_ttl          = optional(string)
    requires_duplicate_detection = optional(bool)
    duplicate_detection_history_time_window = optional(string)
  }))
  default = {}
}

variable "subscription" {
  type = map(object({
    name               = string
    max_delivery_count = number
    status             = string
    tkey               = string
    auto_delete_on_idle   = optional(string)
    default_message_ttl = optional(string)
    lock_duration =optional(string)
  }))
  default = {}
}
