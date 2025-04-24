#------------------------------------------
# Module for Vnet
#------------------------------------------
module "vnt-ci-qa-net-001" {
  source                = "../../../tfs-modules/azurerm_virtual_network"
  create_resource_group = false
  resource_group_name   = "rsg-ci-qa-net-001"
  location              = "Central India"
  address_space = {
    "vnet1" = {
      name          = "vnt-ci-qa-net-001"
      address_space = ["10.0.0.0/16"]
    },
  }
  subnet_prefixes = {
    "subnet1" = {
      name                          = "snt-ci-qa-appgw-001"
      address_prefixes              = ["10.0.1.0/24"]
      skey                          = "vnet1"
      disable_bgp_route_propagation = false
      create_network_security       = true
      create_route_table            = true
      rt_name                       = "rtb-ci-qa-appgw-001"
      nsg_name                      = "nsg-ci-qa-appgw-001"
      enable_delegation             = false
    },
    "subnet2" = {
      name                          = "snt-ci-qa-present-001"
      address_prefixes              = ["10.0.2.0/24"]
      skey                          = "vnet1"
      disable_bgp_route_propagation = false
      create_network_security       = true
      create_route_table            = true
      rt_name                       = "rtb-ci-qa-present-001"
      nsg_name                      = "nsg-ci-qa-present-001"
      enable_delegation             = false
    },
    "subnet3" = {
      name                          = "snt-ci-qa-apps-001"
      address_prefixes              = ["10.0.3.0/24"]
      skey                          = "vnet1"
      disable_bgp_route_propagation = false
      create_network_security       = true
      create_route_table            = true
      rt_name                       = "rtb-ci-qa-apps-001"
      nsg_name                      = "nsg-ci-qa-apps-001"
      enable_delegation             = false
    },
    "subnet4" = {
      name                          = "snt-ci-qa-aks-001"
      address_prefixes              = ["10.0.4.0/24"]
      skey                          = "vnet1"
      disable_bgp_route_propagation = false
      create_network_security       = true
      create_route_table            = true
      rt_name                       = "rtb-ci-qa-aks-001"
      nsg_name                      = "nsg-ci-qa-aks-001"
      enable_delegation             = false
    },
    "subnet5" = {
      name                          = "snt-ci-qa-db-001"
      address_prefixes              = ["10.0.5.0/24"]
      skey                          = "vnet1"
      disable_bgp_route_propagation = false
      create_network_security       = true
      create_route_table            = true
      rt_name                       = "rtb-ci-qa-db-001"
      nsg_name                      = "nsg-ci-qa-db-001"
      enable_delegation             = false
    },
    "subnet6" = {
      name                          = "snt-ci-qa-dbw-001"
      address_prefixes              = ["10.0.6.0/24"]
      skey                          = "vnet1"
      disable_bgp_route_propagation = false
      create_network_security       = true
      create_route_table            = true
      rt_name                       = "rtb-ci-qa-dbw-001"
      nsg_name                      = "nsg-ci-qa-dbw-001"
      enable_delegation             = false
    },
    "subnet7" = {
      name                          = "snt-ci-qa-dbw-002"
      address_prefixes              = ["10.0.7.0/24"]
      skey                          = "vnet1"
      disable_bgp_route_propagation = false
      create_network_security       = true
      create_route_table            = true
      rt_name                       = "rtb-ci-qa-dbw-002"
      nsg_name                      = "nsg-ci-qa-dbw-002"
      enable_delegation             = false
    },
    "subnet8" = {
      name                          = "snt-ci-qa-vi-001"
      address_prefixes              = ["10.0.8.0/24"]
      skey                          = "vnet1"
      disable_bgp_route_propagation = false
      create_network_security       = true
      create_route_table            = true
      rt_name                       = "rtb-ci-qa-vi-001"
      nsg_name                      = "nsg-ci-qa-vi-001"
      enable_delegation             = false
    },
    "subnet9" = {
      name                          = "snt-ci-qa-pvt-001"
      address_prefixes              = ["10.0.9.0/24"]
      skey                          = "vnet1"
      disable_bgp_route_propagation = false
      create_network_security       = true
      create_route_table            = true
      rt_name                       = "rtb-ci-qa-pvt-001"
      nsg_name                      = "nsg-ci-qa-pvt-001"
      enable_delegation             = false
    },

  }
  tags = {
    application        = "Network"
    environment        = "qa"
  }
}
