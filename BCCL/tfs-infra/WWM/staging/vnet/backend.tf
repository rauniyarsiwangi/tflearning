terraform {
  backend "azurerm" {
    resource_group_name  = "rsg-ci-wwm-stg-tfs-01"
    storage_account_name = "staciwwmstgtfs001"
    container_name       = "tfstate"
    key                  = "vnet/default.tfstate"
  }
} 

