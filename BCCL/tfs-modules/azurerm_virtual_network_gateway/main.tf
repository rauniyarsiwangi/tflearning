# To call the resource group name & Vnet name from remote state
locals {
  resource_group_name = var.resource_group_name
  location            = var.location
}

# To Create the Gateway Subnet

data "azurerm_subnet" "subnet" {
  name                 = "GatewaySubnet"
  resource_group_name  = local.resource_group_name
  virtual_network_name = var.vnet_name
}

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
  name                = var.vng_config.name
  resource_group_name = local.resource_group_name
  location            = local.location
  type                = var.vng_config.type
  generation          = var.vng_config.generation
  sku                 = var.vng_config.sku
  active_active       = var.vng_config.active_active

  ip_configuration {
    name                          = "pvp-${var.vng_config.name}"
    public_ip_address_id          = azurerm_public_ip.pip_gw.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = data.azurerm_subnet.subnet.id
  }

  tags = var.vng_config.tags
}

# resource "azurerm_virtual_network_gateway_connection" "vpn" {
#   name                       = var.con_config.name
#   resource_group_name        = local.resource_group_name
#   location                   = local.location
#   type                       = var.con_config.type
#   virtual_network_gateway_id = azurerm_virtual_network_gateway.vpngw.id
#   express_route_circuit_id   = azurerm_express_route_circuit.er_circuit.id

#   depends_on = [
#     azurerm_virtual_network_gateway.vpngw, azurerm_virtual_network_gateway_connection.vpn
#   ]
# }
