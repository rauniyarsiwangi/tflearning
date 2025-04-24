#------------------------------------------
# Module for Vnet
#------------------------------------------
module "vnt-ci-dev-net-001" {
  source                = "../../../tfs-modules/azurerm_virtual_network"
  create_resource_group = false
  resource_group_name   = "rsg-ci-dev-net-001"
  location              = "Central India"
  address_space = {
    "vnet1" = {
      name          = "vnt-ci-dev-net-001"
      address_space = ["192.168.0.0/16"]
    },
  }
  subnet_prefixes = {
    "subnet1" = {
      name                          = "snt-ci-dev-appgw-001"
      address_prefixes              = ["192.168.1.0/24"]
      skey                          = "vnet1"
      disable_bgp_route_propagation = false
      create_network_security       = true
      create_route_table            = true
      rt_name                       = "rtb-ci-dev-appgw-001"
      nsg_name                      = "nsg-ci-dev-appgw-001"
      enable_delegation             = false
    },
    "subnet2" = {
      name                          = "snt-ci-dev-present-001"
      address_prefixes              = ["192.168.2.0/24"]
      skey                          = "vnet1"
      disable_bgp_route_propagation = false
      create_network_security       = true
      create_route_table            = true
      rt_name                       = "rtb-ci-dev-present-001"
      nsg_name                      = "nsg-ci-dev-present-001"
      enable_delegation             = false
    },
    "subnet3" = {
      name                          = "snt-ci-dev-apps-001"
      address_prefixes              = ["192.168.3.0/24"]
      skey                          = "vnet1"
      disable_bgp_route_propagation = false
      create_network_security       = true
      create_route_table            = true
      rt_name                       = "rtb-ci-dev-apps-001"
      nsg_name                      = "nsg-ci-dev-apps-001"
      enable_delegation             = false
    },
    "subnet4" = {
      name                          = "snt-ci-dev-aks-001"
      address_prefixes              = ["192.168.4.0/24"]
      skey                          = "vnet1"
      disable_bgp_route_propagation = false
      create_network_security       = true
      create_route_table            = true
      rt_name                       = "rtb-ci-dev-aks-001"
      nsg_name                      = "nsg-ci-dev-aks-001"
      enable_delegation             = false
    },
    "subnet5" = {
      name                          = "snt-ci-dev-db-001"
      address_prefixes              = ["192.168.5.0/24"]
      skey                          = "vnet1"
      disable_bgp_route_propagation = false
      create_network_security       = true
      create_route_table            = true
      rt_name                       = "rtb-ci-dev-db-001"
      nsg_name                      = "nsg-ci-dev-db-001"
      enable_delegation             = false
    },
    "subnet6" = {
      name                          = "snt-ci-dev-dbw-001"
      address_prefixes              = ["192.168.6.0/24"]
      skey                          = "vnet1"
      disable_bgp_route_propagation = false
      create_network_security       = true
      create_route_table            = true
      rt_name                       = "rtb-ci-dev-dbw-001"
      nsg_name                      = "nsg-ci-dev-dbw-001"
      enable_delegation             = false
    },
    "subnet7" = {
      name                          = "snt-ci-dev-dbw-002"
      address_prefixes              = ["192.168.7.0/24"]
      skey                          = "vnet1"
      disable_bgp_route_propagation = false
      create_network_security       = true
      create_route_table            = true
      rt_name                       = "rtb-ci-dev-dbw-002"
      nsg_name                      = "nsg-ci-dev-dbw-002"
      enable_delegation             = false
    },
    "subnet8" = {
      name                          = "snt-ci-dev-vi-001"
      address_prefixes              = ["192.168.8.0/24"]
      skey                          = "vnet1"
      disable_bgp_route_propagation = false
      create_network_security       = true
      create_route_table            = true
      rt_name                       = "rtb-ci-dev-vi-001"
      nsg_name                      = "nsg-ci-dev-vi-001"
      enable_delegation             = false
    },
    "subnet9" = {
      name                          = "snt-ci-dev-pvt-001"
      address_prefixes              = ["192.168.9.0/24"]
      skey                          = "vnet1"
      disable_bgp_route_propagation = false
      create_network_security       = true
      create_route_table            = true
      rt_name                       = "rtb-ci-dev-pvt-001"
      nsg_name                      = "nsg-ci-dev-pvt-001"
      enable_delegation             = false
    },

  }
  tags = {
    application        = "Network"
    environment        = "dev"
  }
}
