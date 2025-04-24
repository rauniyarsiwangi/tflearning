resource "azurerm_public_ip" "pip" {
  name                = var.pip_name
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = var.pip_allocation_method
  sku                 = var.pip_sku
  ip_tags = {
    "ipTagType" = "RoutingPreference",
    "tag"       = "Internet"
  }
}
