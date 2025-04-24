#------------------------------------------
# Local variables
#------------------------------------------
locals {
  resource_group_name = element(coalescelist(data.azurerm_resource_group.rgrp.*.name, azurerm_resource_group.rg.*.name, [""]), 0)
  location            = element(coalescelist(data.azurerm_resource_group.rgrp.*.location, azurerm_resource_group.rg.*.location, [""]), 0)
}
#------------------------------------------
# Virtual Networks
#------------------------------------------
data "azurerm_resource_group" "rgrp" {
  count = var.create_resource_group == false ? 1 : 0
  name  = var.resource_group_name
}

resource "azurerm_resource_group" "rg" {
  count    = var.create_resource_group ? 1 : 0
  name     = lower(var.resource_group_name)
  location = var.location
  tags     = var.tags
}

resource "azurerm_nat_gateway" "nat_gateway" {
  name                    = var.natgw_name
  location                = local.location
  resource_group_name     = local.resource_group_name
  sku_name                = var.sku_name
  idle_timeout_in_minutes = var.idle_timeout_in_minutes
  zones                   = var.zones
}


resource "azurerm_public_ip" "pip" {
  for_each            = var.create_pip == true ? var.pip_config : {}
  name                = each.value["name"]
  location            = local.location
  resource_group_name = local.resource_group_name
  allocation_method   = each.value["allocation_method"]
  sku                 = each.value["sku"]
  zones               = each.value["zones"]
  domain_name_label   = each.value["domain_name_label"]
  sku_tier            = each.value["sku_tier"]
  tags                = var.tags
}

resource "azurerm_nat_gateway_public_ip_association" "pip" {
  for_each             = var.create_pip == true ? var.pip_config : {}
  nat_gateway_id       = azurerm_nat_gateway.nat_gateway.id
  public_ip_address_id = azurerm_public_ip.pip[each.key].id
}

resource "azurerm_public_ip_prefix" "pip_prefix" {
  for_each            = var.create_pip_prefix == true ? var.pip_prefix_config : {}
  name                = each.value["name"]
  location            = local.location
  resource_group_name = local.resource_group_name
  prefix_length       = each.value["prefix_length"]
  zones               = each.value["zones"]
  sku                 = each.value["sku"]
  tags                = var.tags
}

resource "azurerm_nat_gateway_public_ip_prefix_association" "pip_prefix" {
  for_each            = var.create_pip_prefix == true ? var.pip_prefix_config : {}
  nat_gateway_id      = azurerm_nat_gateway.nat_gateway.id
  public_ip_prefix_id = azurerm_public_ip_prefix.pip_prefix[each.key].id
}

data "azurerm_subnet" "subnet" {
  for_each             = var.subnet_association ? var.subnets : {}
  name                 = each.value["subnet_name"]
  virtual_network_name = each.value["vnet_name"]
  resource_group_name  = each.value["vnet_rg_name"]
}
resource "azurerm_subnet_nat_gateway_association" "subnet" {
  for_each       = var.subnet_association == true ? var.subnets : {}
  subnet_id      = data.azurerm_subnet.subnet[each.key].id
  nat_gateway_id = azurerm_nat_gateway.nat_gateway.id
}
