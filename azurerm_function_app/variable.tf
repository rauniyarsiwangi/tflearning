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

variable "asp_rg_name" {
  type        = string
  default     = ""
  description = "Name of the existing app service plan resource group name."
}

variable "create_resource_group" {
  default     = false
  description = "Name of the resource group."
  type        = bool
}
variable "tags" {
  type        = map(string)
  default     = {}
  description = "A mapping of tags to assign to the resource."
}

variable "stg_name" {
  type        = string
  description = "Storageaccount Name - all lower case - not more than 24"
  default     = ""
}

variable "storage_rg_name" {
  type        = string
  description = "Storageaccount Name - all lower case - not more than 24"
  default     = ""
}

variable "account_tier" {
  type        = string
  description = "stroageaccount account tier Standard/permium"
  default     = "Standard"
}
variable "account_replication_type" {
  type        = string
  description = "stroageaccount account_replication_type LRS/GRS"
  default     = "LRS"
}

variable "plan_name" {
  type        = string
  description = "App Service Plan Name"
  default     = "corma-app-plan"
}

variable "kind" {
  type        = string
  description = "App Service kind windows or linux"
  default     = "linux"
}

variable "existing_asp" {
  default     = false
  description = "Name of the existing asp name."
  type        = bool
}

variable "function_name" {
  type        = string
  description = "Function Name to be deployed"
  default     = "corma-function-app"
}

variable "tier" {
  type        = string
  description = "App Service Plan tier"
  default     = "Standard"
}


variable "size" {
  type        = string
  description = "App service size"
  default     = "S1"
}

# variable "app_settings" {
#   default     = {
#     FUNCTIONS_WORKERS_RUNTIME = "Java"
#     FUNCTIONS_WORKERS_RUNTIME_VERSION = "11"
#     }
#   type        = "map"
#   description = "Application settings to insert on creating the function app. Following updates will be ignored, and has to be set manually. Updates done on application deploy or in portal will not affect terraform state file."
# }

variable "functions_runtime" {
  description = "name of the functions runtime"
  type        = string
  default     = "Java"
}

variable "functions_runtime_version" {
  description = "version of the functions runtime"
  type        = number
  default     = 6.0
}

variable "subnets" {
  type = map(object({
    name                 = string
    virtual_network_name = string
    resource_group_name  = string
    skey                 = string
  }))
  default = {}
}

variable "vnet_integration" {
  type    = bool
  default = false
}

# Variable To Enabled the Application insigts
variable "app_insights_connection_string" {
  description = "Connection string for Application Insights"
  type        = string
  default     = ""
}


variable "app_insights_name" {
  description = "Name for Application Insights"
  type        = string
  default     = ""
}
variable "enable_app_insights" {
  description = "Flag to enable or disable the creation of Azure Application Insights"
  type        = bool
  default     = false
}

variable "Stack_version" {
  description = "The desired .NET version for the Function App"
  type        = string
  default     = ""
}

variable "https_only" {
  type        = bool
  description = "Can the Function App only be accessed via HTTPS? Defaults to false."
  default     = false
}

variable "always_on" {
  type        = bool
  description = "Can the Function App only be accessed via HTTPS? Defaults to false."
  default     = true
}

variable "use_32_bit_worker_process" {
  type        = bool
  description = "Can the Function App only be accessed via HTTPS? Defaults to false."
  default     = false
}
