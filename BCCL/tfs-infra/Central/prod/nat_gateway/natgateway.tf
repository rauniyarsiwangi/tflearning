module "prod_nat" {
  source                = "../../../../tfs-modules/azurerm_nat_gateway"
  create_resource_group = false
  resource_group_name   = "rsg-ci-central-prd-shs-01"
  location              = "central india"
  natgw_name            = "nat-ci-central-prd-shs-01"
  sku_name              = "Standard"
  create_pip            = false
  create_pip_prefix     = true
  subnet_association    = true
  pip_config            = {}
  pip_prefix_config = {
    "pip1" = {
      name          = "pip-ci-central-prd-nat-01"
      prefix_length = "29"
      sku           = "Standard"
      zones         = ["1", "2", "3"]
    }
  }
  subnets = {
    "subnet1" = {
      subnet_name  = "snt-ci-central-prd-app-01"
      vnet_name    = "vnet-ci-central-prd-net-01"
      vnet_rg_name = "rsg-ci-central-prd-net-01"
    }
  }


  tags = {
    application = "agi/slike"
    environment = "prod"
  }
}
