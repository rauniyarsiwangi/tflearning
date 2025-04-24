
locals {
  resource_group_name = element(coalescelist(data.azurerm_resource_group.infra.*.name, azurerm_resource_group.infra.*.name, [""]), 0)
  location            = element(coalescelist(data.azurerm_resource_group.infra.*.location, azurerm_resource_group.infra.*.location, [""]), 0)
}

data "azurerm_resource_group" "infra" {
  count = var.create_resource_group == false ? 1 : 0
  name  = var.resource_group_name
}

resource "azurerm_resource_group" "infra" {
  count    = var.create_resource_group ? 1 : 0
  name     = var.resource_group_name
  location = var.location
}


resource "azurerm_subnet" "route_server_subnet" {
  name                 = "RouteServerSubnet"
  resource_group_name  = var.vnet_rg_name
  virtual_network_name = var.vnet_name
  address_prefixes     = var.subnet_address_prefixes
}

resource "azurerm_public_ip" "route_server_public_ip" {
  name                = var.public_ip_name
  resource_group_name = local.resource_group_name
  location            = local.location
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_route_server" "route_server" {
  name                 = var.route_server_name
  resource_group_name  = local.resource_group_name
  location             = local.location
  sku                  = var.route_server_sku
  public_ip_address_id = azurerm_public_ip.route_server_public_ip.id
  subnet_id            = azurerm_subnet.route_server_subnet.id
}


output "route_server_ip_address" {
  value = azurerm_public_ip.route_server_public_ip.ip_address
}
