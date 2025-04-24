#------------------------------------------
# Module for Vnet
#------------------------------------------
module "vnet-ci-wwm-prd-net-01" {
  source                = "../../../../tfs-modules/azurerm_virtual_network"
  create_resource_group = false
  resource_group_name   = "rsg-ci-wwm-prd-net-01"
  location              = "Central India"
  address_space = {
    "vnet1" = {
      name          = "vnet-ci-wwm-prd-net-01"
      address_space = ["10.15.0.0/23"]
    },
  }
  subnet_prefixes = {
    "subnet1" = {
      name                          = "snt-ci-wwm-prd-app-01"
      address_prefixes              = ["10.15.0.0/26"]
      skey                          = "vnet1"
      disable_bgp_route_propagation = false
      create_network_security       = true
      create_route_table            = true
      rt_name                       = "rtb-ci-wwm-prd-app-01"
      nsg_name                      = "nsg-ci-wwm-prd-app-01"
      enable_delegation             = false
    },
    "subnet2" = {
      name                          = "snt-ci-wwm-prd-db-01"
      address_prefixes              = ["10.15.0.64/26"]
      skey                          = "vnet1"
      disable_bgp_route_propagation = false
      create_network_security       = true
      create_route_table            = true
      rt_name                       = "rtb-ci-wwm-prd-db-01"
      nsg_name                      = "nsg-ci-wwm-prd-db-01"
      enable_delegation             = false
    },
    "subnet3" = {
      name                          = "snt-ci-wwm-prd-appgw-01"
      address_prefixes              = ["10.15.0.128/25"]
      skey                          = "vnet1"
      disable_bgp_route_propagation = false
      create_network_security       = false
      create_route_table            = true
      rt_name                       = "rtb-ci-wwm-prd-appgw-01"
      nsg_name                      = null
      enable_delegation             = false
    },
  }
  tags = {
    application   = "wwm"
    environment   = "prd"
    Resource_type = "Virtual Network"
  }
}
