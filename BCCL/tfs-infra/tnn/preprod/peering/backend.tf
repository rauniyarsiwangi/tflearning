terraform {
  backend "azurerm" {
    resource_group_name  = "rsg-ci-tnn-preprod-tfs-001"
    storage_account_name = "stacitnnpreprodtfs01"
    container_name       = "tfstate"
    key                  = "peering/default.tfstate"
  }
} 
