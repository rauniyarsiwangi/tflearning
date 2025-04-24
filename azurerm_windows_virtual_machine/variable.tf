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

variable "subnet_name" {
  type    = string
  default = ""
}

variable "vnet_name" {
  type    = string
  default = ""
}

variable "vnet_rg_name" {
  type    = string
  default = ""
}

variable "create_public_ip" {
  type    = bool
  default = false
}

variable "public_ip_name" {
  type    = string
  default = ""
}

variable "pip_add_allocation" {
  type    = string
  default = ""
}

variable "private_ip_address" {
  type    = string
  default = ""
}

variable "vm_config" {
  type = map(object({
    name                     = string
    size                     = string
    computer_name            = string
    admin_username           = string
    admin_password           = string
    computer_name            = string
    provision_vm_agent       = optional(bool)
    enable_automatic_updates = optional(bool)
    license_type             = optional(string)
    zone                     = optional(string)
    availability_set_id      = optional(string)
  }))
}


variable "caching_type" {
  type    = string
  default = ""
}

variable "os_disk_name" {
  type    = string
  default = ""
}


variable "disk_type" {
  type    = string
  default = ""
}

variable "os_disk_size_gb" {
  type    = string
  default = ""
}

variable "os_publisher" {
  type    = string
  default = ""
}

variable "os_offer" {
  type    = string
  default = ""
}

variable "os_sku" {
  type    = string
  default = ""
}

variable "image_version" {
  type    = string
  default = ""
}

variable "data_disk_config" {
  type = map(object({
    name                 = string
    storage_account_type = string
    disk_size_gb         = string
    lun                  = number
    caching              = string
    vmkey                = string
    zone                 = optional(string)
  }))
}

variable "create_data_disk" {
  type    = bool
  default = false
}

variable "tags" {
  description = "The tags to associate with resources"
  type        = any
  default = {
    environment = "test"
  }
}

variable "nic_name" {
  type    = string
  default = ""
}
