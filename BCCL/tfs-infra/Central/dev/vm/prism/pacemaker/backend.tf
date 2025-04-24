terraform {
  backend "azurerm" {
    resource_group_name  = "rsg-ci-central-dev-tfs-01"
    storage_account_name = "stacicentraldevtfs001"
    container_name       = "tfstate"
    key                  = "prism/vm/pacemaker/default.tfstate"
  }
} 
