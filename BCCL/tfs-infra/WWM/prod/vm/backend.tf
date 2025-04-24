terraform {
  backend "azurerm" {
    resource_group_name  = "rsg-ci-wwm-prd-tfs-01"
    storage_account_name = "staciwwmprdtfs001"
    container_name       = "tfstate"
    key                  = "vm/default.tfstate"
  }
} 

