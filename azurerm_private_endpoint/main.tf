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

data "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  virtual_network_name = var.vnet_name
  resource_group_name  = var.vnet_rg_name
}

resource "azurerm_private_endpoint" "infra" {
  name                          = var.pe_resource_name
  location                      = var.location
  resource_group_name           = local.resource_group_name
  subnet_id                     = data.azurerm_subnet.subnet.id
  tags                          = var.tags
  custom_network_interface_name = var.custom_network_interface_name

  # ip_configuration {
  #   name               = var.ip_configuration_name
  #   private_ip_address = var.private_ip_address
  # }

  private_service_connection {
    name                           = var.pse_resource_name
    is_manual_connection           = var.is_manual_connection
    private_connection_resource_id = var.endpoint_resource_id
    subresource_names              = var.subresource_names
  }
}
