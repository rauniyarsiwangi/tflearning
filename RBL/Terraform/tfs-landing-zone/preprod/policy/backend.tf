terraform {
  backend "azurerm" {
    resource_group_name  = "test-rg"
    storage_account_name = "backendstoragetfs"
    container_name       = "tfstate"
    key                  = "preprod-policy/default.tfstate"
  }
}
