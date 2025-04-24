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
####################################################################################################################
# Existing Os Disk Details

variable "snapshot_name" {
  type        = string
  default     = ""
  description = "Source os disk name."
}

variable "tags" {
  type = any
}

variable "snapshot_rg" {
  type        = string
  default     = ""
  description = "Name of the resource group of Source Os disk's."
}

variable "os_disk_name" {
  type        = string
  default     = ""
  description = "dest os disk name."
}

#  OS Disk snaphot_details

variable "stg_acc_type" {
  type        = string
  default     = ""
  description = "storage_account_type"
}

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

variable "dd_config" {
  type = map(object({
    name                = string
    resource_group_name = string
    dd_name             = string
    stg_acc_type        = string
  }))
  default = {}
}

variable "target_sub_id" {
  type    = string
  default = "70d38d58-1218-4237-8c41-52ebcd730d6f"
}

variable "source_sub_id" {
  type    = string
  default = "7db5edec-770e-4175-a75b-edaa6f1de631"
}

# variable "Subnet_name" {
#   type        = string
#   default     = ""
#   description = "Subnet name"
# }

# variable "vnet_name" {
#   type        = string
#   default     = ""
#   description = "vnet name"
# }

# variable "vnet_rg_name" {
#   type        = string
#   default     = ""
#   description = "vnet_rg_name"
# }

# variable "public_ip_name" {
#   type        = string
#   default     = ""
#   description = "publicip name"
# }

# #######################################################################################################################
# # Existing Data Disk Details

# variable "nic_name" {
#   type        = string
#   default     = ""
#   description = "nic name"
# }

# variable "pip_add_allocation" {
#   type        = string
#   default     = ""
#   description = "pip_add_allocation"
# }

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

# # variable "disable_password_authentication" {
# #   type        = bool
# #   default     = true
# #   description = ""
# # }

# #  Data Disk snaphot_details

# variable "private_ip_address" {
#   type        = string
#   default     = ""
#   description = "private_ip_address"
# }

# variable "snapshot_name" {
#   type        = string
#   default     = ""
#   description = "existing snapshot name"
# }

# variable "snapshot_rg" {
#   type        = string
#   default     = ""
#   description = "existing snapshot name"
# }


# variable "vm_config" {
#   type = map(object({
#     name           = string
#     vm_size        = string
#     # computer_name  = string
#     # admin_username = string
#     # admin_password = optional(string)
#     stg_acc_type   = string
#     os_type        = string
#     create_option  = string
#   }))
# }

# # variable "source_sub_id" {
# #   type        = string
# #   default     = ""
# #   description = "source seubscription id"
# # }

# # variable "dest_sub_id" {
# #   type        = string
# #   default     = ""
# #   description = "destination seubscription id"
# # }
