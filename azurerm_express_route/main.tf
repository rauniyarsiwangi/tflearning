# To call the resource group name & Vnet name from remote state
locals {
  resource_group_name = var.resource_group_name
  location            = var.location
  vnet_name           = var.vnet_name
  loc_prefix          = var.location
}

# To Create the Gateway Subnet

resource "azurerm_subnet" "subnet" {
  name                 = "GatewaySubnet"
  resource_group_name  = local.resource_group_name
  virtual_network_name = local.vnet_name
  address_prefixes     = var.gateway_subnet
}

#------------------------------------------
# Route Tables
#------------------------------------------

resource "azurerm_route_table" "route_table" {
  name                = var.route_table_name
  resource_group_name = local.resource_group_name
  location            = local.location
  depends_on = [
    azurerm_subnet.subnet
  ]
  tags = var.tags
}
#------------------------------------------
# Subnets with Route Tables
#------------------------------------------

resource "azurerm_subnet_route_table_association" "sub_rt" {
  route_table_id = azurerm_route_table.route_table.id
  subnet_id      = azurerm_subnet.subnet.id
  depends_on = [
    azurerm_route_table.route_table, azurerm_subnet.subnet
  ]
}

# To create the Express route Circuit

resource "azurerm_express_route_circuit" "er_circuit" {
  name                     = "ckt-${var.er_config.name}"
  resource_group_name      = local.resource_group_name
  location                 = local.location
  service_provider_name    = var.er_config.service_provider_name
  peering_location         = var.er_config.peering_location
  bandwidth_in_mbps        = var.er_config.bandwidth_in_mbps
  allow_classic_operations = var.er_config.allow_classic_operations
  sku {
    tier   = var.sku.tier
    family = var.sku.family
  }

  tags = var.er_config.tags
}

#Creating Random string for domain name label

resource "random_string" "str" {
  length  = 6
  special = false
  upper   = false
  keepers = {
    domain_name_label = var.vng_config.name
  }
}

#---------------------------------------------
# Public IP for Virtual Network Gateway
#---------------------------------------------
resource "azurerm_public_ip" "pip_gw" {
  name                = lower("pip-${var.vng_config.name}")
  location            = local.location
  resource_group_name = local.resource_group_name
  allocation_method   = var.pip_allocation_method
  sku                 = var.public_ip_sku
  domain_name_label   = format("gw%s%s", lower(replace(var.vng_config.name, "/[[:^alnum:]]/", "")), random_string.str.result)
  tags                = var.tags
}

#-------------------------------
# Virtual Network Gateway 
#-------------------------------
resource "azurerm_virtual_network_gateway" "vpngw" {
  name                = "exg-${var.vng_config.name}"
  resource_group_name = local.resource_group_name
  location            = local.location
  type                = var.vng_config.type
  sku                 = var.vng_config.sku
  active_active       = var.vng_config.active_active

  ip_configuration {
    name                          = "pvp-${var.vng_config.name}"
    public_ip_address_id          = azurerm_public_ip.pip_gw.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.subnet.id
  }
  tags = var.vng_config.tags
}

#Connection between Source and Target

resource "azurerm_virtual_network_gateway_connection" "expressroute" {
  name                       = "exg-${var.con_config.name}"
  resource_group_name        = local.resource_group_name
  location                   = local.location
  type                       = var.con_config.type
  virtual_network_gateway_id = azurerm_virtual_network_gateway.vpngw.id
  express_route_circuit_id   = azurerm_express_route_circuit.er_circuit.id

  depends_on = [
    azurerm_virtual_network_gateway.vpngw, azurerm_virtual_network_gateway_connection.expressroute
  ]
}
