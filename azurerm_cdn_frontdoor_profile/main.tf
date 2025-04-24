locals {
  resource_group_name = element(coalescelist(data.azurerm_resource_group.rg.*.name, azurerm_resource_group.rg.*.name, [""]), 0)
  location            = element(coalescelist(data.azurerm_resource_group.rg.*.location, azurerm_resource_group.rg.*.location, [""]), 0)
}

data "azurerm_resource_group" "rg" {
  count = var.create_resource_group == false ? 1 : 0
  name  = var.resource_group_name
}

resource "azurerm_resource_group" "rg" {
  count    = var.create_resource_group == true ? 1 : 0
  location = var.location
  name     = var.resource_group_name
}
resource "azurerm_cdn_frontdoor_profile" "example" {
  name                = var.profile_name
  resource_group_name = local.resource_group_name
  sku_name            = var.profile_sku
  response_timeout_seconds = var.response_timeout_seconds
  tags = var.tags
}
