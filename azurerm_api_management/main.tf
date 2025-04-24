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

data "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  virtual_network_name = var.vnet_name
  resource_group_name  = var.vnet_rg_name
}

resource "azurerm_api_management" "api" {
  name                          = var.api_name
  location                      = local.location
  resource_group_name           = local.resource_group_name
  publisher_name                = var.publisher_name
  publisher_email               = var.publisher_email
  sku_name                      = var.sku
  virtual_network_type          = var.virtual_network_type
  public_network_access_enabled = var.public_network_access_enabled
  public_ip_address_id          = data.azurerm_public_ip.pip.id
  zones                         = var.zones
  # private_ip_addresses          = var.private_ip_addresses
  virtual_network_configuration {
    subnet_id = data.azurerm_subnet.subnet.id
  }
  identity {
    type = "SystemAssigned"
  }
  tags = var.tags

lifecycle {
  ignore_changes = [ identity ]
}
}

data "azurerm_public_ip" "pip" {
  name                = var.pip_name
  resource_group_name = var.pip_rg_name
}
