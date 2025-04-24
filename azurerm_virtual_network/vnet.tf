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
#------------------------------------------
# Virtual Networks
#------------------------------------------

resource "azurerm_virtual_network" "vnet" {
  for_each            = var.address_space
  name                = "vnt-${each.value["name"]}"
  resource_group_name = local.resource_group_name
  location            = local.location
  address_space       = each.value["address_space"]
  tags                = var.tags
  lifecycle {
    ignore_changes = [tags]
  }
}
#------------------------------------------
# Subnets
#------------------------------------------

resource "azurerm_subnet" "subnet" {
  for_each             = var.subnet_prefixes
  name                 = "snt-${each.value["name"]}"
  address_prefixes     = each.value["address_prefixes"]
  resource_group_name  = local.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet[each.value.skey].name
  lifecycle {
    ignore_changes = [service_endpoints, delegation]
  }
}
#------------------------------------------
# NSGs
#------------------------------------------

resource "azurerm_network_security_group" "nsg" {
  for_each            = { for key, value in var.subnet_prefixes : key => value if value.nsg_name != null }
  name                = each.value["nsg_name"]
  resource_group_name = local.resource_group_name
  location            = local.location
  depends_on = [
    azurerm_subnet.subnet
  ]
  tags = var.tags
  lifecycle {
    ignore_changes = [tags]
  }
}

#------------------------------------------
# Subnets with NSGs
#------------------------------------------

resource "azurerm_subnet_network_security_group_association" "sub_nsg" {
  for_each                  = { for key, value in var.subnet_prefixes : key => value if value.nsg_name != null }
  network_security_group_id = azurerm_network_security_group.nsg[each.key].id
  subnet_id                 = azurerm_subnet.subnet[each.key].id
  depends_on = [
    azurerm_network_security_group.nsg, azurerm_subnet.subnet
  ]
}
#------------------------------------------
# Route Tables
#------------------------------------------

resource "azurerm_route_table" "route_table" {
  for_each                      = { for key, value in var.subnet_prefixes : key => value if value.rt_name != null && value.create_route_table == true }
  name                          = each.value["rt_name"]
  resource_group_name           = local.resource_group_name
  location                      = local.location
  disable_bgp_route_propagation = each.value["disable_bgp_route_propagation"]
  depends_on = [
    azurerm_subnet.subnet
  ]
  tags = var.tags
  lifecycle {
    ignore_changes = [tags]
  }
}
#------------------------------------------
# Subnets with Route Tables
#------------------------------------------

data "azurerm_route_table" "rt" {
  for_each            = { for key, value in var.subnet_prefixes : key => value if value.rt_name != null && value.create_route_table == false }
  name                = each.value["rt_name"]
  resource_group_name = local.resource_group_name
}

resource "azurerm_subnet_route_table_association" "sub_rt" {
  for_each       = { for key, value in var.subnet_prefixes : key => value if value.rt_name != null && value.create_route_table == true }
  route_table_id = azurerm_route_table.route_table[each.key].id
  subnet_id      = azurerm_subnet.subnet[each.key].id
  depends_on = [
    azurerm_route_table.route_table, azurerm_subnet.subnet
  ]
}

resource "azurerm_subnet_route_table_association" "rt_sub" {
  for_each       = { for key, value in var.subnet_prefixes : key => value if value.rt_name != null && value.create_route_table == false }
  route_table_id =  data.azurerm_route_table.rt[each.key].id
  subnet_id      = azurerm_subnet.subnet[each.key].id
  depends_on = [
    azurerm_route_table.route_table, azurerm_subnet.subnet
  ]
}
