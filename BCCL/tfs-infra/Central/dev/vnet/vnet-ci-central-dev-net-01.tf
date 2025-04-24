#------------------------------------------
# Module for Vnet
#------------------------------------------
module "vnet-ci-central-dev-net-01" {
  source                = "../../../../tfs-modules/azurerm_virtual_network"
  create_resource_group = false
  resource_group_name   = "rsg-ci-central-dev-net-01"
  location              = "Central India"
  address_space = {
    "vnet1" = {
      name          = "vnet-ci-central-dev-net-01"
      address_space = ["10.12.0.0/16"]
    },
  }
  subnet_prefixes = {
    "subnet1" = {
      name                          = "snt-ci-central-dev-appgw-01"
      address_prefixes              = ["10.12.16.0/24"]
      skey                          = "vnet1"
      disable_bgp_route_propagation = false
      create_network_security       = false
      create_route_table            = true
      rt_name                       = "rtb-ci-central-dev-appgw-01"
      nsg_name                      = null
      enable_delegation             = false
    },
    "subnet2" = {
      name                          = "snt-ci-central-dev-app-01"
      address_prefixes              = ["10.12.0.0/21"]
      skey                          = "vnet1"
      disable_bgp_route_propagation = false
      create_network_security       = true
      create_route_table            = true
      rt_name                       = "rtb-ci-central-dev-app-01"
      nsg_name                      = "nsg-ci-central-dev-app-01"
      enable_delegation             = false
    },
    "subnet3" = {
      name                          = "snt-ci-central-dev-db-01"
      address_prefixes              = ["10.12.8.0/21"]
      skey                          = "vnet1"
      disable_bgp_route_propagation = false
      create_network_security       = true
      create_route_table            = true
      rt_name                       = "rtb-ci-central-dev-db-01"
      nsg_name                      = "nsg-ci-central-dev-db-01"
      enable_delegation             = false
    },

  }
  tags = {
    application   = "Central"
    environment   = "dev"
    Resource_type = "Virtual Network"
  }
}
