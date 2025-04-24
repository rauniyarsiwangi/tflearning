module "netapp-rg-vnt-to-test-rg-vnt" {
  source                         = "../../../tfs-Modules/azurerm_vnet_hub_peering"
  location                       = "Central india"
  hub_vnet_name                  = "netapp-rg-vnet"
  hub_vnet_resource_group_name   = "netapp-rg"
  spoke_vnet_name                = "test-rg-vnet"
  spoke_vnet_resource_group_name = "test-rg"
  allow_gateway_transit          = true
}
