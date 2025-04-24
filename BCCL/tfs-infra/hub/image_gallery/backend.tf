terraform {
  backend "azurerm" {
    resource_group_name  = "rsg-ci-hub-prd-tfs-01"
    storage_account_name = "stacihubprdtfs001"
    container_name       = "tfstate"
    key                  = "gallery/default.tfstate"
  }
}
