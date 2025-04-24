module "ecom-dev-jmp" {
  source                         = "../../../tfs-modules/azurerm_vnet_peering"
  location                       = "Central india"
  hub_vnet_name                  = "vnt-ci-hub-net-001"
  hub_vnet_resource_group_name   = "rsg-ci-hub-net-001"
  spoke_vnet_name                = "vnt-ci-dev-net-001"
  spoke_vnet_resource_group_name = "rsg-ci-dev-net-001"
  use_remote_gateways            = false
  allow_gateway_transit          = true
}
