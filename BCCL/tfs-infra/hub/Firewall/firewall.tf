module "firewall" {
  source                = "../../../tfs-modules/azurerm_firewall"
  create_resource_group = false
  resource_group_name   = "rsg-ci-hub-prd-net-01"
  location              = "Central india"
  subnet_name           = "AzureFirewallSubnet"
  virtual_network_name  = "vnet-ci-hub-prd-net-01"
  vnet_rg_name          = "rsg-ci-hub-prd-net-01"
  pip_name              = "pip-ci-hub-prd-fwl-01"
  fw_name               = "fwl-ci-hub-prd-net-01"
  fw_sku_name           = "AZFW_VNet"
  fw_sku_tier           = "Premium"
  fw_policy_name        = "policy-ci-hub-prd-fwl-01"
  fw_policy_sku         = "Premium"
}
