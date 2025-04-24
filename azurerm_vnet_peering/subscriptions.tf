provider "azurerm" {
  features {}
  subscription_id = "70d38d58-1218-4237-8c41-52ebcd730d6f"
  alias           = "source"
}

provider "azurerm" {
  alias           = "dest"
  subscription_id = var.dest_sub_id
  features {}
}
