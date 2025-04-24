module "bst-ci-hub-prd-shs-01" {
  source                 = "../../../tfs-modules/azurerm_bastion_host"
  resource_group_name    = "rsg-ci-hub-prd-shs-01"
  location               = "Central India"
  subnet_name            = "AzureBastionSubnet"
  vnet_name              = "vnet-ci-hub-prd-net-01"
  vnet_rg_name           = "rsg-ci-hub-prd-net-01"
  pip_name               = "pip-ci-hub-prd-bst-01"
  bst_name               = "bst-ci-hub-prd-shs-01"
  copy_paste_enabled     = true
  file_copy_enabled      = true
  sku                    = "Standard"
  shareable_link_enabled = true
  tunneling_enabled      = false
  ip_connect_enabled     = true
  scale_units            = 2
  tags                   = {}
}
