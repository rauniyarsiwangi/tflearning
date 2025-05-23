

module "tnn-dev-to-hub" {
  source = "../../../../tfs-modules/azurerm_vnet_peering"
  vnet_peering_connections = {
    "peering1" = {
      name                      = "vnet-ci-hub-prd-net-01-to-vnet-ci-tnn-dev-net-01"
      remote_virtual_network_id = "/subscriptions/1d68bd1c-9b74-4746-9ebf-9501e41dcd1f/resourceGroups/rsg-ci-hub-prd-net-01/providers/Microsoft.Network/virtualNetworks/vnet-ci-hub-prd-net-01"
    },
  }
  allow_gateway_transit = true
  use_remote_gateways   = false
  resource_group_name   = "rsg-ci-tnn-dev-net-01"
  virtual_network_name  = "vnet-ci-tnn-dev-net-01"
}

