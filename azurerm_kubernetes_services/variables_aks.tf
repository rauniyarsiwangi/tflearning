variable "create_resource_group" {
  type    = bool
  default = false
}

variable "admin_enabled" {
  type    = bool
  default = false
}

variable "secret_rotation_enabled" {
  type    = bool
  default = false
}

variable "azure_policy_enabled" {
  type    = bool
  default = true
}
variable "msi_auth_for_monitoring_enabled" {
  type    = bool
  default = true
}


variable "resource_group_name" {
  type    = string
  default = ""
}

variable "role_definition_name" {
  type    = string
  default = "AcrPull"
}

variable "manual_role" {
  type    = bool
  default = false
}

variable "principal_id" {
  type    = string
  default = ""
}

# variable "pod_cidr" {
#   type    = string
#   default = "10.244.0.0/16"
# }

# variable "service_cidr" {
#   type    = string
#   default = "10.0.0.0/16"
# }

# variable "dns_service_ip" {
#   type    = string
#   default = "10.0.0.10"
# }

variable "key_data" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDqsRr2BB0OAG4KkMziAQW6ZRAWww/mUmOJ2+K67HrauVh+jdgvSUaRvn7zOX1RAnLZM/XfJBDe4jF9fekdUQamrvvmvzSU8FhEu4Nv7NE8v/FxyIQ1t5a8DSehHiYJ76FFuVMtZwrohYwEOw5rsSJkTi1wWvgsAPSrjc4FAEr21R2BwOwHXKYzgsckYrtjzxwshLakhZe6+SEL3nvhbKvqr8DbMHFbotWrNestIVIPU5Jh5AC3GJ3G4qzKMYuCnIo8R1HTRs0NAMZ7qPKcyIcxg5Z0lDSiVUjkW0P69Tqgru007FVxVi9dKp3pe6lSfkBZSzVpFP09JcVBWcdkBeWn"
}
variable "admin_username" {
  default = "azureuser"
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

variable "cluster_name" {
  type    = string
  default = ""
}


variable "dns_prefix" {
  type    = string
  default = ""
}

variable "acr_name" {
  type    = string
  default = ""
}

variable "acr_id" {
  type    = string
  default = null
}


variable "akv_user_identity" {
}

variable "kubernetes_version" {
  type = string
}
variable "sku" {
  type    = string
  default = "Free"
}

variable "network_profile_load_balancer_sku" {
  default = "standard"
}
variable "network_profile_network_plugin" {
}

variable "tags" {
  description = "Tags to apply to all resources created."
  type        = map(string)
}

variable "attach_usernodepool" {
  type    = bool
  default = true
}

variable "create_container_registry" {
  type    = bool
  default = false
}

variable "acr" {
  type = map(object({
    name = string
    sku  = string
  }))
  default = {}
}

variable "usernodepull" {
  type = map(object({
    name                        = string
    vm_size                     = string
    enable_auto_scaling         = bool
    max_count                   = optional(number)
    min_count                   = optional(number)
    node_count                  = optional(number)
    os_disk_type                = string
    zones                       = optional(list(string))
    node_labels                 = optional(map(string))
    node_taints                 = optional(list(string))
    max_pods                    = optional(number)
    mode                        = optional(string)
    os_disk_size_gb             = optional(string)
    temporary_name_for_rotation = optional(string)
  }))
  default = {}
}

variable "node_resource_group" {
  type    = string
  default = "aks-ci-ecom-pt-crt-inf-mgrg-01"
}

variable "nodepool" {
  type = map(object({
    name                        = string
    enable_auto_scaling         = bool
    max_count                   = optional(number)
    min_count                   = optional(number)
    node_count                  = optional(number)
    vm_size                     = string
    os_disk_type                = string
    type                        = string
    zones                       = optional(list(string))
    ultra_ssd_enabled           = bool
    os_disk_size_gb             = optional(string)
    agents_labels               = optional(map(string))
    max_pods                    = optional(number)
    temporary_name_for_rotation = optional(string)
  }))
  default = {}
}
