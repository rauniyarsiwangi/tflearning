

resource "azurerm_virtual_network_peering" "virtual_network_peering" {
  for_each                  = var.vnet_peering_connections
  name                      = each.value.name
  resource_group_name       = var.resource_group_name
  virtual_network_name      = var.virtual_network_name
  remote_virtual_network_id = each.value.remote_virtual_network_id
  allow_forwarded_traffic   = var.allow_forwarded_traffic
  allow_gateway_transit     = var.allow_gateway_transit
  use_remote_gateways       = var.use_remote_gateways
  lifecycle {
    ignore_changes = [allow_forwarded_traffic, allow_gateway_transit, use_remote_gateways]
  }
}
