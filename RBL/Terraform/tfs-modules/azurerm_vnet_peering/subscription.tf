provider "azurerm" {
  features {}
  subscription_id = "e2470aef-5dbd-4e01-bece-4abc90b8d719"
  alias           = "source"
}

provider "azurerm" {
  alias           = "dest"
  subscription_id = "e2470aef-5dbd-4e01-bece-4abc90b8d719"
  features {}
}
