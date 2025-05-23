#variables for the vm creation

variable "ssh_key" {
  description = "Azure SSH Key Name"
  type        = string
  default     = "ubuntu_prod_pem_v1"
}


variable "tags" {
  type        = map(string)
  description = "A map of the tags to use on the resources that are deployed with this module."
  default = {
    source = "terraform"
  }
}


variable "vnet_rg_name" {
  description = "VNET RG NAME"
  type        = string
  default     = ""
}

variable "ssh_key_rg" {
  description = "VNET RG NAME"
  type        = string
  default     = ""
}


variable "private_ip_address" {
  description = "private ip address"
  type        = string
  default     = ""
}


variable "caching_type" {
  type        = string
  default     = "ReadWrite"
  description = "Type of caching"
}


variable "location" {
  type        = string
  default     = "Australia East"
  description = "Location of the resource group."
}

#configuration for publicip address

variable "create_resource_group" {
  type    = bool
  default = false
}

variable "resource_group_name" {
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

variable "enable_ssh_key" {
  type    = bool
  default = false
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


variable "vm_config" {
  type = map(object({
    name                     = string
    size                     = string
    admin_username           = string
    admin_password           = optional(string)
    provision_vm_agent       = optional(bool)
    enable_automatic_updates = optional(bool)
    license_type             = optional(string)
    zone                     = optional(string)
    availability_set_id      = optional(string)
  }))
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

variable "disable_password_authentication" {
  type    = bool
  default = false
}

variable "nic_name" {
  type    = string
  default = ""
}
