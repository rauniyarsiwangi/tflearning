module "hub-to-tnn-preprod" {
  source = "../../../tfs-modules/azurerm_vnet_peering"
  vnet_peering_connections = {
    "peering1" = {
      name                      = "vnet-ci-hub-prd-net-01-to-vnet-ci-tnn-preprod-net-01"
      remote_virtual_network_id = "/subscriptions/588a7cf3-57fc-4821-8be9-75dc6dc2e21e/resourceGroups/rsg-ci-tnn-preprod-net-01/providers/Microsoft.Network/virtualNetworks/vnet-ci-tnn-preprod-net-01"
    },
  }
  allow_gateway_transit = true
  use_remote_gateways   = false
  resource_group_name   = "rsg-ci-hub-prd-net-01"
  virtual_network_name  = "vnet-ci-hub-prd-net-01"
}
