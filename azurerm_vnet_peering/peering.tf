
data "azurerm_virtual_network" "hub" {
  provider            = azurerm.source
  name                = var.hub_vnet_name
  resource_group_name = var.hub_vnet_resource_group_name
}

data "azurerm_virtual_network" "spoke" {
  provider            = azurerm.dest
  name                = var.spoke_vnet_name
  resource_group_name = var.spoke_vnet_resource_group_name
}


#Creating Peering source to destination
resource "azurerm_virtual_network_peering" "peering_source_to_destination" {
  provider                     = azurerm.dest
  name                         = "${var.spoke_vnet_name}-to-${var.hub_vnet_name}"
  resource_group_name          = data.azurerm_virtual_network.spoke.resource_group_name
  virtual_network_name         = data.azurerm_virtual_network.spoke.name
  remote_virtual_network_id    = data.azurerm_virtual_network.hub.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  use_remote_gateways          = var.use_remote_gateways
}

#Creating Peering destination to source
resource "azurerm_virtual_network_peering" "peering_destination_to_source" {
  provider                     = azurerm.source
  name                         = "${var.hub_vnet_name}-to-${var.spoke_vnet_name}"
  resource_group_name          = data.azurerm_virtual_network.hub.resource_group_name
  virtual_network_name         = data.azurerm_virtual_network.hub.name
  remote_virtual_network_id    = data.azurerm_virtual_network.spoke.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = var.allow_gateway_transit

  depends_on = [
    azurerm_virtual_network_peering.peering_source_to_destination
  ]
}

