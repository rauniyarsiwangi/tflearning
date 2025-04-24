#------------------------------------------
# Module for Vnet
#------------------------------------------
module "vnet-ci-wwm-stg-net-01" {
  source                = "../../../../tfs-modules/azurerm_virtual_network"
  create_resource_group = false
  resource_group_name   = "rsg-ci-wwm-stg-net-01"
  location              = "Central India"
  address_space = {
    "vnet1" = {
      name          = "vnet-ci-wwm-stg-net-01"
      address_space = ["10.15.2.0/24"]
    },
  }
  subnet_prefixes = {
    "subnet1" = {
      name                          = "snt-ci-wwm-stg-app-01"
      address_prefixes              = ["10.15.2.0/27"]
      skey                          = "vnet1"
      disable_bgp_route_propagation = false
      create_network_security       = true
      create_route_table            = true
      rt_name                       = "rtb-ci-wwm-stg-app-01"
      nsg_name                      = "nsg-ci-wwm-stg-app-01"
      enable_delegation             = false
    },
    "subnet2" = {
      name                          = "snt-ci-wwm-stg-db-01"
      address_prefixes              = ["10.15.2.32/27"]
      skey                          = "vnet1"
      disable_bgp_route_propagation = false
      create_network_security       = true
      create_route_table            = true
      rt_name                       = "rtb-ci-wwm-stg-db-01"
      nsg_name                      = "nsg-ci-wwm-stg-db-01"
      enable_delegation             = false
    },
    "subnet3" = {
      name                          = "snt-ci-wwm-stg-appgw-01"
      address_prefixes              = ["10.15.2.64/26"]
      skey                          = "vnet1"
      disable_bgp_route_propagation = false
      create_network_security       = false
      create_route_table            = true
      rt_name                       = "rtb-ci-wwm-stg-appgw-01"
      nsg_name                      = null
      enable_delegation             = false
    },
  }
  tags = {
    application   = "wwm"
    environment   = "stg"
    Resource_type = "Virtual Network"
  }
}
