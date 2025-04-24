variable "location" {
  type        = string
  default     = "East US"
  description = "Location of resource group"

}
variable "resource_group_name" {
  type        = string
  default     = ""
  description = "Name of the resource group."
}

variable "create_resource_group" {
  default     = false
  description = "Name of the resource group."
  type        = bool
}
variable "name" {
  description = "Name used for the deployment. All resources prefixed based on the Azure naming convention."
  type        = string
}

variable "type" {
  type        = string
  description = "identity type of the azurerm_synapse_workspace"
}

variable "storage_account" {
  description = "Settings used when creating the Storage Account."
  type = object({
    name                            = string
    account_tier                    = string
    account_replication_type        = string
    allow_nested_items_to_be_public = bool
  })

  # validation {
  #   condition     = length(var.storage_account_name) >= 3 && length(var.storage_account_name) <= 24
  #   error_message = "Storage account names must be between 3 and 24 characters long."
  # }
}

variable "adls_filesystem" {
  description = "A list of Data Lake filesystems."
  type        = list(string)
  default     = ["data"]
}

variable "purview_id" {
  description = "The ID for the instance of Purview used with this Synapse workspace."
  type        = string
  default     = null
}

variable "sql_administrator" {
  description = "Username and password used for Synapse."
  type = object({
    login    = string
    password = string
  })
}

variable "dedicated_sql_pool" {
  description = "List of dedicated SQL pools."
  type = list(object({
    name        = string
    sku_name    = string
    create_mode = string
  }))
  default = []
}

variable "synapse_spark_pool" {
  description = "List of Synapse Spark pools."
  type = list(object({
    name                           = string
    node_size_family               = string
    node_size                      = string
    cache_size                     = number
    auto_pause_delay_in_minutes    = number
    session_level_packages_enabled = optional(bool)
    # Dynamic executor allocation is not supported with the current
    # azurerm provider, as it is using a deprecated package.
    #dynamic_executor_allocation_enabled = optional(bool)
    spark_version = optional(number)
    node_count    = optional(number)
    auto_scale = optional(object({
      max_node_count = number
      min_node_count = number
    }))
    library_requirement = optional(object({
      content  = string
      filename = string
    }))
    spark_config = optional(object({
      content  = string
      filename = string
    }))
  }))
  default = []
}

variable "azure_devops_repo" {
  description = "Definition of the Azure DevOps repository used with Synapse."
  type = object({
    account_name    = string
    branch_name     = string
    project_name    = string
    repository_name = string
    root_folder     = string
    tenant_id       = string
  })
  default = null
}

variable "synapse_firewall_rule" {
  description = "List of objects to create Synapse firewall rules."
  type = list(object({
    name             = string
    start_ip_address = string
    end_ip_address   = string
  }))
  default = []
}

variable "role_assignment" {
  description = "A list of objects to to assign roles to the Synapse workspace."
  type = list(object({
    role_name    = string
    principal_id = string
  }))
  default = []
}

variable "ignore_changes" {
  description = "(Experimental) A list of objects that we should ignore the changes for."
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "A map object used for all resources in the module."
  type        = map(string)
}

variable "synpep_name" {
  type        = string
  default     = "synpep-test"
  description = "private end point for the synapse"
}

variable "attach_pe" {
  type       = bool
  default = false
}
