terraform {
  backend "azurerm" {
    resource_group_name  = "rsg-ci-central-prd-tfs-01"
    storage_account_name = "stacicentralprdtfs001"
    container_name       = "tfstate"
    key                  = "prism/vm/chryslis/default.tfstate"
  }
} 
