variable "storage_account_name" {
  type        = string
  description = "Specifies a custom name for the resource."
  default     = ""
}

variable "create_resource_group" {
  type    = bool
  default = false
}

variable "allow_nested_items_to_be_public" {
  type    = bool
  default = false
}

variable "default_to_oauth_authentication" {
  type    = bool
  default = false
}

variable "cross_tenant_replication_enabled" {
  type    = bool
  default = false
}

variable "attach_vnet" {
  type    = bool
  default = false
}

variable "resource_group_name" {
  type        = string
  description = "Specifies the parent resource group name."
  default     = ""
}

variable "location" {
  type        = string
  description = "Specifies the parent resource group location."
  default     = ""
}


variable "account_kind" {
  description = "The type of storage account. Valid options are BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2."
  default     = ""
}

variable "account_replication_type" {
  type    = string
  default = ""
}

variable "hns_enabled" {
  type    = bool
  default = true
}

variable "skuname" {
  description = "The SKUs supported by Microsoft Azure Storage. Valid options are Premium_LRS, Premium_ZRS, Standard_GRS, Standard_GZRS, Standard_LRS, Standard_RAGRS, Standard_RAGZRS, Standard_ZRS"
  default     = ""
}

variable "access_tier" {
  description = "Defines the access tier for BlobStorage and StorageV2 accounts. Valid options are Hot and Cool."
  default     = ""
}

variable "shared_access_key_enabled" {
  description = "Indicates whether the storage account permits requests to be authorized with the account access key via Shared Key. If false, then all requests, including shared access signatures, must be authorized with Azure Active Directory (Azure AD)."
  default     = true
}
variable "enable_https_traffic_only" {
  default = true
}
variable "public_network_access_enabled" {
  default = true
}
variable "static_website" {
  description = "Static web site configuration. static_website can only be set when the account_kind is set to StorageV2 or BlockBlobStorage."
  type        = object({ index_document = string, error_404_document = string })
  default     = null
}

variable "subnets" {
  type = map(object({
    name                 = string
    resource_group_name  = string
    virtual_network_name = string
  }))
  default = {}
}

variable "network_rules" {
  description = "Network rules restricing access to the storage account."
  type        = list(object({ default_action = string, ip_rules = list(string), subnet_ids = optional(list(string)), skey = optional(string) }))
  default     = null
}

variable "identity_type" {
  type    = string
  default = null
}

variable "enable_con" {
  type    = bool
  default = false
}

variable "large_file_share_enabled" {
  type    = bool
  default = true
}

variable "enable_fs" {
  type    = bool
  default = false
}

variable "enable_pe" {
  type    = bool
  default = false
}
# variable "enable_table" {
#   type    = bool
#   default = false
# }
# variable "enable_queue" {
#   type    = bool
#   default = false
# }

variable "containers" {
  type = map(object({
    name                  = string
    container_access_type = string
  }))
  default = {}
}

variable "fileshare" {
  type = map(object({
    name  = string
    quota = number
  }))
  default = {}
}

variable "private_endpoint" {
  type = map(object({
    pe_name           = string
    psc_name          = string
    subresource_names = list(string)
  }))
  default = {}
}

variable "tags" {
  type = any
}

variable "custom_domain_name" {
  type    = string
  default = ""
}
