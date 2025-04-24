module "dev_nat" {
  source                = "../../../../tfs-modules/azurerm_nat_gateway"
  create_resource_group = false
  resource_group_name   = "rsg-spoke-agi-slike-dev-ci-001-Anshu"
  location              = "central india"
  natgw_name            = "dev_natgw"
  sku_name              = "Standard"
  create_pip            = true
  create_pip_prefix     = false
  subnet_association    = true
  pip_config = {
    "pip1" = {
      name              = "dev-nat_gw-pip"
      allocation_method = "Static"
      sku               = "Standard"
    }
  }

  pip_prefix_config = {}
  subnets = {
    "subnet1" = {
      subnet_name  = "General-Subnet-01"
      vnet_name    = "vnet-spoke-agi-slike-dev-ci-01"
      vnet_rg_name = "rsg-spoke-agi-slike-dev-ci-001-Anshu"
    }
  }


  tags = {
    application = "agi/slike"
    environment = "dev"
  }
}
