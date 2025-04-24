terraform {
  backend "azurerm" {
    resource_group_name  = "rsg-ci-tnn-dev-tfs-01"
    storage_account_name = "stacitnndevtfs001"
    container_name       = "tfstate"
    key                  = "vnet/default.tfstate"
  }
} 
