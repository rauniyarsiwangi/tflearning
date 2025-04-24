module "prod_nat" {
  source                = "../../../tfs-modules/azurerm_nat_gateway"
  create_resource_group = false
  resource_group_name   = "rsg-ci-hub-prd-shs-01"
  location              = "central india"
  natgw_name            = "nat-ci-hub-prd-shs-01"
  sku_name              = "Standard"
  create_pip            = true
  create_pip_prefix     = false
  subnet_association    = true
  pip_config = {
    "pip1" = {
      name              = "pip-ci-hub-prd-nat-01"
      allocation_method = "Static"
      sku               = "Standard"
    }
  }
  pip_prefix_config = {}
  subnets = {
    "subnet1" = {
      subnet_name  = "snt-ci-hub-prd-shs-01"
      vnet_name    = "vnet-ci-hub-prd-net-01"
      vnet_rg_name = "rsg-ci-hub-prd-net-01"
    }
  }
  tags = {
    application = "hub"
    environment = "prod"
  }
}
