provider "azurerm" {
  alias           = "source"
  subscription_id = var.source_sub_id
  tenant_id       = "62544226-1533-4b60-979f-b10f86521124"
  features {}
}

provider "azurerm" {
  alias           = "dest"
  subscription_id = var.target_sub_id
  tenant_id       = "62544226-1533-4b60-979f-b10f86521124"
  features {}
}
