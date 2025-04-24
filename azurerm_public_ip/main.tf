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
}

resource "azurerm_public_ip" "pip" {
  name                = var.pip_name
  resource_group_name = local.resource_group_name
  location            = local.location
  allocation_method   = var.allocation_method
  sku                 = "Standard"
  domain_name_label   = var.pip_name
  tags                = var.tags
}
