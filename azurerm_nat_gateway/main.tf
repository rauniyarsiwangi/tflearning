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
  tags     = var.tags
}

resource "azurerm_public_ip_prefix" "infra" {
  for_each            = var.create_pip_prefix ? var.pip_prefix : {}
  name                = each.value["name"]
  location            = local.location
  resource_group_name = local.resource_group_name
  prefix_length       = each.value["prefix_length"]
  zones               = each.value["zones"]
  tags                = var.tags
}

resource "azurerm_public_ip" "infra" {
  for_each            = var.create_public_ip ? var.pip : {}
  name                = each.value["name"]
  location            = local.location
  resource_group_name = local.resource_group_name
  allocation_method   = "Static"
  sku                 = each.value["sku"]
  tags                = var.tags
}

resource "azurerm_nat_gateway" "infra" {
  name                    = var.nat_gw_name
  location                = local.location
  resource_group_name     = local.resource_group_name
  sku_name                = var.sku_name == "" ? "Standard" : var.sku_name
  idle_timeout_in_minutes = var.idle_timeout_in_minutes
  tags                    = var.tags
}

resource "azurerm_nat_gateway_public_ip_association" "pip_association" {
  for_each             = var.create_public_ip ? var.pip : {}
  nat_gateway_id       = azurerm_nat_gateway.infra.id
  public_ip_address_id = azurerm_public_ip.infra[each.key].id
}

data "azurerm_subnet" "infra" {
  for_each             = var.subnets
  name                 = each.value.name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
}

resource "azurerm_subnet_nat_gateway_association" "infra" {
  for_each       = var.subnet_association ? var.subnets : {}
  subnet_id      = data.azurerm_subnet.infra[each.key].id
  nat_gateway_id = azurerm_nat_gateway.infra.id
}

resource "azurerm_nat_gateway_public_ip_prefix_association" "example" {
  for_each            = var.create_pip_prefix ? var.pip_prefix : {}
  nat_gateway_id      = azurerm_nat_gateway.infra.id
  public_ip_prefix_id = azurerm_public_ip_prefix.infra[each.key].id
}
