terraform {
  backend "azurerm" {
    resource_group_name  = "rsg-ci-tnn-prd-tfs-01"
    storage_account_name = "stacitnnprdtfs001"
    container_name       = "tfstate"
    key                  = "peering/default.tfstate"
  }
} 
