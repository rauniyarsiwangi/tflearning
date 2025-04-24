locals {
  resource_group_name = element(coalescelist(data.azurerm_resource_group.rgrp.*.name, azurerm_resource_group.rg.*.name, [""]), 0)
  location            = element(coalescelist(data.azurerm_resource_group.rgrp.*.location, azurerm_resource_group.rg.*.location, [""]), 0)
  # pip_name            = element(coalescelist(data.azurerm_public_ip.pip.*.name, azurerm_public_ip.pip.*.name, [""]), 0)
}
data "azurerm_resource_group" "rgrp" {
  count = var.create_resource_group == false ? 1 : 0
  name  = var.resource_group_name
}

resource "azurerm_resource_group" "rg" {
  count    = var.create_resource_group ? 1 : 0
  name     = lower(var.resource_group_name)
  location = var.location
}

data "azurerm_virtual_network" "vnet" {
  count               = var.attach_subnet == true ? 1 : 0
  name                = var.vnet_name
  resource_group_name = var.vnet_rg_name
}

data "azurerm_subnet" "private" {
  count                = var.attach_subnet == true ? 1 : 0
  name                 = var.private_subnet_name
  virtual_network_name = var.vnet_name
  resource_group_name  = var.vnet_rg_name
}

data "azurerm_subnet" "public" {
  count                = var.attach_subnet == true ? 1 : 0
  name                 = var.public_subnet_name
  virtual_network_name = var.vnet_name
  resource_group_name  = var.vnet_rg_name
}

# data "azurerm_nat_gateway" "nat_gw" {
#   for_each            = var.attach_nat == true ? var.nategateways : {}
#   name                = each.value["name"]
#   resource_group_name = each.value["resource_group_name"]
# }

resource "azurerm_databricks_workspace" "databricks" {
  name                        = var.databricks_name
  resource_group_name         = local.resource_group_name
  location                    = local.location
  sku                         = var.sku
  managed_resource_group_name = "${var.databricks_name}-managed"

  dynamic "custom_parameters" {
    for_each = var.custom_parameters
    content {
      virtual_network_id                                   = var.attach_subnet == true ? data.azurerm_virtual_network.vnet.0.id : null
      public_ip_name                                       = custom_parameters.value.public_ip_name
      public_subnet_name                                   = var.attach_subnet == true ? data.azurerm_subnet.public.0.name : null
      private_subnet_name                                  = var.attach_subnet == true ? data.azurerm_subnet.private.0.name : null
      no_public_ip                                         = custom_parameters.value.no_public_ip
      nat_gateway_name                                     = custom_parameters.value.nat_gateway_name
      public_subnet_network_security_group_association_id  = var.attach_subnet == true ? data.azurerm_subnet.public.0.id : null
      private_subnet_network_security_group_association_id = var.attach_subnet == true ? data.azurerm_subnet.private.0.id : null
    }
  }
  tags = var.tags
}

