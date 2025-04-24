#------------------------------------------
# Module for Vnet
#------------------------------------------
module "vnt-ci-uat-net-001" {
  source                = "../../../tfs-modules/azurerm_virtual_network"
  create_resource_group = false
  resource_group_name   = "rsg-ci-uat-net-001"
  location              = "Central India"
  address_space = {
    "vnet1" = {
      name          = "vnt-ci-uat-net-001"
      address_space = ["10.0.0.0/16"]
    },
  }
  subnet_prefixes = {
    "subnet1" = {
      name                          = "snt-ci-uat-appgw-001"
      address_prefixes              = ["10.0.1.0/24"]
      skey                          = "vnet1"
      disable_bgp_route_propagation = false
      create_network_security       = true
      create_route_table            = true
      rt_name                       = "rtb-ci-uat-appgw-001"
      nsg_name                      = "nsg-ci-uat-appgw-001"
      enable_delegation             = false
    },
    "subnet2" = {
      name                          = "snt-ci-uat-present-001"
      address_prefixes              = ["10.0.2.0/24"]
      skey                          = "vnet1"
      disable_bgp_route_propagation = false
      create_network_security       = true
      create_route_table            = true
      rt_name                       = "rtb-ci-uat-present-001"
      nsg_name                      = "nsg-ci-uat-present-001"
      enable_delegation             = false
    },
    "subnet3" = {
      name                          = "snt-ci-uat-apps-001"
      address_prefixes              = ["10.0.3.0/24"]
      skey                          = "vnet1"
      disable_bgp_route_propagation = false
      create_network_security       = true
      create_route_table            = true
      rt_name                       = "rtb-ci-uat-apps-001"
      nsg_name                      = "nsg-ci-uat-apps-001"
      enable_delegation             = false
    },
    "subnet4" = {
      name                          = "snt-ci-uat-aks-001"
      address_prefixes              = ["10.0.4.0/24"]
      skey                          = "vnet1"
      disable_bgp_route_propagation = false
      create_network_security       = true
      create_route_table            = true
      rt_name                       = "rtb-ci-uat-aks-001"
      nsg_name                      = "nsg-ci-uat-aks-001"
      enable_delegation             = false
    },
    "subnet5" = {
      name                          = "snt-ci-uat-db-001"
      address_prefixes              = ["10.0.5.0/24"]
      skey                          = "vnet1"
      disable_bgp_route_propagation = false
      create_network_security       = true
      create_route_table            = true
      rt_name                       = "rtb-ci-uat-db-001"
      nsg_name                      = "nsg-ci-uat-db-001"
      enable_delegation             = false
    },
    "subnet6" = {
      name                          = "snt-ci-uat-dbw-001"
      address_prefixes              = ["10.0.6.0/24"]
      skey                          = "vnet1"
      disable_bgp_route_propagation = false
      create_network_security       = true
      create_route_table            = true
      rt_name                       = "rtb-ci-uat-dbw-001"
      nsg_name                      = "nsg-ci-uat-dbw-001"
      enable_delegation             = false
    },
    "subnet7" = {
      name                          = "snt-ci-uat-dbw-002"
      address_prefixes              = ["10.0.7.0/24"]
      skey                          = "vnet1"
      disable_bgp_route_propagation = false
      create_network_security       = true
      create_route_table            = true
      rt_name                       = "rtb-ci-uat-dbw-002"
      nsg_name                      = "nsg-ci-uat-dbw-002"
      enable_delegation             = false
    },
    "subnet8" = {
      name                          = "snt-ci-uat-vi-001"
      address_prefixes              = ["10.0.8.0/24"]
      skey                          = "vnet1"
      disable_bgp_route_propagation = false
      create_network_security       = true
      create_route_table            = true
      rt_name                       = "rtb-ci-uat-vi-001"
      nsg_name                      = "nsg-ci-uat-vi-001"
      enable_delegation             = false
    },
    "subnet9" = {
      name                          = "snt-ci-uat-pvt-001"
      address_prefixes              = ["10.0.9.0/24"]
      skey                          = "vnet1"
      disable_bgp_route_propagation = false
      create_network_security       = true
      create_route_table            = true
      rt_name                       = "rtb-ci-uat-pvt-001"
      nsg_name                      = "nsg-ci-uat-pvt-001"
      enable_delegation             = false
    },

  }
  tags = {
    application        = "Network"
    environment        = "uat"
  }
}
