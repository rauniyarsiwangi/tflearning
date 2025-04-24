terraform {
  backend "azurerm" {
    resource_group_name  = "rsg-ci-wwm-qa-tfs-01"
    storage_account_name = "staciwwmqatfs001"
    container_name       = "tfstate"
    key                  = "vnet/default.tfstate"
  }
} 

