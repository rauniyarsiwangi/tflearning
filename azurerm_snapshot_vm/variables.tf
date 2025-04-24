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

variable "storage_uri" {
  type    = string
  default = null
}

variable "av_set_id" {
  type    = any
  default = null
}

variable "diag_enabled" {
  type    = bool
  default = false
}



variable "tags" {
  type = any
}
####################################################################################################################
# Existing Os Disk Details

variable "managed_disk_name" {
  type        = string
  default     = ""
  description = "Source os disk name."
}

variable "managed_disk_rg" {
  type        = string
  default     = ""
  description = "Name of the resource group of Source Os disk's."
}

# variable "os_disk_name" {
#   type        = string
#   default     = ""
#   description = "dest os disk name."
# }

# #  OS Disk snaphot_details

# variable "stg_acc_type" {
#   type        = string
#   default     = ""
#   description = "storage_account_type"
# }

# variable "create_option" {
#   type        = string
#   default     = "Copy"
#   description = "create_option"
# }

# managed_disk_info OS

variable "existing_data_disk" {
  type        = bool
  default     = false
  description = "Existing data disk is there or not"
}

variable "create_public_ip" {
  type        = bool
  default     = false
  description = "Existing data disk is there or not"
}

variable "dd_config" {
  type = map(object({
    name                = string
    resource_group_name = string
    # dd_name             = string
    # stg_acc_type        = string
    # create_option       = string
    lun     = string
    caching = string
    vmkey   = string
  }))
  default = {}
}

variable "Subnet_name" {
  type        = string
  default     = ""
  description = "Subnet name"
}

variable "vnet_name" {
  type        = string
  default     = ""
  description = "vnet name"
}

variable "vnet_rg_name" {
  type        = string
  default     = ""
  description = "vnet_rg_name"
}

variable "public_ip_name" {
  type        = string
  default     = ""
  description = "publicip name"
}

#######################################################################################################################
# Existing Data Disk Details

variable "nic_name" {
  type        = string
  default     = ""
  description = "nic name"
}

variable "pip_add_allocation" {
  type        = string
  default     = ""
  description = "pip_add_allocation"
}

# variable "ssh_key" {
#   type        = string
#   default     = ""
#   description = "ssh key name"
# }

# variable "ssh_key_rg" {
#   type        = string
#   default     = ""
#   description = "rg of ssh key"
# }

# variable "disable_password_authentication" {
#   type        = bool
#   default     = true
#   description = ""
# }

#  Data Disk snaphot_details

variable "private_ip_address" {
  type        = string
  default     = ""
  description = "private_ip_address"
}

variable "dns_ip" {
  type        = list(string)
  default     = ["10.15.40.68", "10.15.40.69", "168.63.129.16"]
  description = "dns server ip"
}

variable "snapshot_name" {
  type        = string
  default     = ""
  description = "existing snapshot name"
}

variable "snapshot_rg" {
  type        = string
  default     = ""
  description = "existing snapshot resource group"
}

variable "availability_set_name" {
  type        = string
  default     = "test_av_set"
  description = "availability_set_name"
}


variable "fault_domain_count" {
  type        = number
  default     = 2
  description = "fault_domain_count"
}


variable "update_domain_count" {
  type        = string
  default     = ""
  description = "update_domain_count"
}

variable "managed" {
  type    = bool
  default = true
}


variable "vm_config" {
  type = map(object({
    name                = string
    vm_size             = string
    stg_acc_type        = string
    os_type             = string
    create_option       = string
    availability_set_id = optional(string)
  }))
}

variable "enable_availability_set" {
  type    = bool
  default = false
}


# variable "source_sub_id" {
#   type        = string
#   default     = ""
#   description = "source seubscription id"
# }

# variable "dest_sub_id" {
#   type        = string
#   default     = ""
#   description = "destination seubscription id"
# }
