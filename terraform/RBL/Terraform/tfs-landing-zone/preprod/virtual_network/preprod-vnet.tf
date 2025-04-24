#------------------------------------------
# Module for Vnet
#------------------------------------------
module "vnt-ci-preprod-net-001" {
  source                = "../../../tfs-modules/azurerm_virtual_network"
  create_resource_group = false
  resource_group_name   = "rsg-ci-preprod-net-001"
  location              = "Central India"
  address_space = {
    "vnet1" = {
      name          = "vnt-ci-preprod-net-001"
      address_space = ["10.0.0.0/16"]
    },
  }
  subnet_prefixes = {
    "subnet1" = {
      name                          = "snt-ci-preprod-appgw-001"
      address_prefixes              = ["10.0.1.0/24"]
      skey                          = "vnet1"
      disable_bgp_route_propagation = false
      create_network_security       = true
      create_route_table            = true
      rt_name                       = "rtb-ci-preprod-appgw-001"
      nsg_name                      = "nsg-ci-preprod-appgw-001"
      enable_delegation             = false
    },
    "subnet2" = {
      name                          = "snt-ci-preprod-present-001"
      address_prefixes              = ["10.0.2.0/24"]
      skey                          = "vnet1"
      disable_bgp_route_propagation = false
      create_network_security       = true
      create_route_table            = true
      rt_name                       = "rtb-ci-preprod-present-001"
      nsg_name                      = "nsg-ci-preprod-present-001"
      enable_delegation             = false
    },
    "subnet3" = {
      name                          = "snt-ci-preprod-apps-001"
      address_prefixes              = ["10.0.3.0/24"]
      skey                          = "vnet1"
      disable_bgp_route_propagation = false
      create_network_security       = true
      create_route_table            = true
      rt_name                       = "rtb-ci-preprod-apps-001"
      nsg_name                      = "nsg-ci-preprod-apps-001"
      enable_delegation             = false
    },
    "subnet4" = {
      name                          = "snt-ci-preprod-aks-001"
      address_prefixes              = ["10.0.4.0/24"]
      skey                          = "vnet1"
      disable_bgp_route_propagation = false
      create_network_security       = true
      create_route_table            = true
      rt_name                       = "rtb-ci-preprod-aks-001"
      nsg_name                      = "nsg-ci-preprod-aks-001"
      enable_delegation             = false
    },
    "subnet5" = {
      name                          = "snt-ci-preprod-db-001"
      address_prefixes              = ["10.0.5.0/24"]
      skey                          = "vnet1"
      disable_bgp_route_propagation = false
      create_network_security       = true
      create_route_table            = true
      rt_name                       = "rtb-ci-preprod-db-001"
      nsg_name                      = "nsg-ci-preprod-db-001"
      enable_delegation             = false
    },
    "subnet6" = {
      name                          = "snt-ci-preprod-dbw-001"
      address_prefixes              = ["10.0.6.0/24"]
      skey                          = "vnet1"
      disable_bgp_route_propagation = false
      create_network_security       = true
      create_route_table            = true
      rt_name                       = "rtb-ci-preprod-dbw-001"
      nsg_name                      = "nsg-ci-preprod-dbw-001"
      enable_delegation             = false
    },
    "subnet7" = {
      name                          = "snt-ci-preprod-dbw-002"
      address_prefixes              = ["10.0.7.0/24"]
      skey                          = "vnet1"
      disable_bgp_route_propagation = false
      create_network_security       = true
      create_route_table            = true
      rt_name                       = "rtb-ci-preprod-dbw-002"
      nsg_name                      = "nsg-ci-preprod-dbw-002"
      enable_delegation             = false
    },
    "subnet8" = {
      name                          = "snt-ci-preprod-vi-001"
      address_prefixes              = ["10.0.8.0/24"]
      skey                          = "vnet1"
      disable_bgp_route_propagation = false
      create_network_security       = true
      create_route_table            = true
      rt_name                       = "rtb-ci-preprod-vi-001"
      nsg_name                      = "nsg-ci-preprod-vi-001"
      enable_delegation             = false
    },
    "subnet9" = {
      name                          = "snt-ci-preprod-pvt-001"
      address_prefixes              = ["10.0.9.0/24"]
      skey                          = "vnet1"
      disable_bgp_route_propagation = false
      create_network_security       = true
      create_route_table            = true
      rt_name                       = "rtb-ci-preprod-pvt-001"
      nsg_name                      = "nsg-ci-preprod-pvt-001"
      enable_delegation             = false
    },

  }
  tags = {
    application        = "Network"
    environment        = "preprod"
  }
}
