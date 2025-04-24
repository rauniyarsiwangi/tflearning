#------------------------------------------
# Module for Vnet
#------------------------------------------
module "vnet-ci-tnn-dev-net-01" {
  source                = "../../../../tfs-modules/azurerm_virtual_network"
  create_resource_group = false
  resource_group_name   = "rsg-ci-tnn-dev-net-01"
  location              = "Central India"
  address_space = {
    "vnet1" = {
      name          = "vnet-ci-tnn-dev-net-01"
      address_space = ["10.14.0.0/17"]
    },
  }
  subnet_prefixes = {
    "subnet1" = {
      name                          = "snt-ci-tnn-dev-appgw-01"
      address_prefixes              = ["10.14.16.0/24"]
      skey                          = "vnet1"
      disable_bgp_route_propagation = false
      create_network_security       = false
      create_route_table            = true
      rt_name                       = "rtb-ci-tnn-dev-appgw-01"
      nsg_name                      = null
      enable_delegation             = false
    },
    "subnet2" = {
      name                          = "snt-ci-tnn-dev-app-01"
      address_prefixes              = ["10.14.0.0/21"]
      skey                          = "vnet1"
      disable_bgp_route_propagation = false
      create_network_security       = true
      create_route_table            = true
      rt_name                       = "rtb-ci-tnn-dev-app-01"
      nsg_name                      = "nsg-ci-tnn-dev-app-01"
      enable_delegation             = false
    },
    "subnet3" = {
      name                          = "snt-ci-tnn-dev-db-01"
      address_prefixes              = ["10.14.8.0/21"]
      skey                          = "vnet1"
      disable_bgp_route_propagation = false
      create_network_security       = true
      create_route_table            = true
      rt_name                       = "rtb-ci-tnn-dev-db-01"
      nsg_name                      = "nsg-ci-tnn-dev-app-01"
      enable_delegation             = false
    },

  }
  tags = {
    application        = "tnn"
    environment        = "dev"
  }
}
