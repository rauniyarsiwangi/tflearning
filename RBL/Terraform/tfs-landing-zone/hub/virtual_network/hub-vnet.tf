#------------------------------------------
# Module for Vnet
#------------------------------------------
module "vnt-ci-hub-net-001" {
  source                = "../../../tfs-modules/azurerm_virtual_network"
  create_resource_group = false
  resource_group_name   = "rsg-ci-hub-net-001" 
  location              = "Central India"
  address_space = {
    "vnet1" = {
      name          = "vnt-ci-hub-net-001"
      address_space = ["10.0.0.0/16"]
    },
  }
  subnet_prefixes = {
    "subnet1" = {
      name                          = "snt-ci-hub-appgw-001"
      address_prefixes              = ["10.0.1.0/24"]
      skey                          = "vnet1"
      disable_bgp_route_propagation = false
      create_network_security       = false
      create_route_table            = true
      rt_name                       = "rtb-ci-hub-appgw-001"
      nsg_name                      = null
      enable_delegation             = false
    },
    "subnet2" = {
      name                          = "snt-ci-hub-fwlwan-001"
      address_prefixes              = ["10.0.2.0/24"]
      skey                          = "vnet1"
      disable_bgp_route_propagation = false
      create_network_security       = true
      create_route_table            = true
      rt_name                       = "rtb-ci-hub-fwlwan-001"
      nsg_name                      = "nsg-ci-hub-fwlwan-001"
      enable_delegation             = false
    },
    "subnet3" = {
      name                          = "snt-ci-hub-fwllan-001"
      address_prefixes              = ["10.0.3.0/24"]
      skey                          = "vnet1"
      disable_bgp_route_propagation = false
      create_network_security       = true
      create_route_table            = true
      rt_name                       = "rtb-ci-hub-fwllan-001"
      nsg_name                      = "nsg-ci-hub-fwllan-001"
      enable_delegation             = false
    },
    "subnet4" = {
      name                          = "snt-ci-hub-fwlmgmt-001"
      address_prefixes              = ["10.0.4.0/24"]
      skey                          = "vnet1"
      disable_bgp_route_propagation = false
      create_network_security       = true
      create_route_table            = true
      rt_name                       = "rtb-ci-hub-fwlmgmt-001"
      nsg_name                      = "nsg-ci-hub-fwlmgmt-001"
      enable_delegation             = false
    },
    "subnet5" = {
      name                          = "snt-ci-hub-shs-001"
      address_prefixes              = ["10.0.5.0/24"]
      skey                          = "vnet1"
      disable_bgp_route_propagation = false
      create_network_security       = true
      create_route_table            = true
      rt_name                       = "rtb-ci-hub-shs-001"
      nsg_name                      = "nsg-ci-hub-shs-001"
      enable_delegation             = false
    },
    "subnet6" = {
      name                          = "snt-ci-hub-inbound-001"
      address_prefixes              = ["10.0.6.0/24"]
      skey                          = "vnet1"
      disable_bgp_route_propagation = false
      create_network_security       = true
      create_route_table            = true
      rt_name                       = "rtb-ci-hub-inbound-001"
      nsg_name                      = "nsg-ci-hub-inbound-001"
      enable_delegation             = false
    },
    "subnet7" = {
      name                          = "snt-ci-hub-outbound-001"
      address_prefixes              = ["10.0.7.0/24"]
      skey                          = "vnet1"
      disable_bgp_route_propagation = false
      create_network_security       = true
      create_route_table            = true
      rt_name                       = "rtb-ci-hub-outbound-001"
      nsg_name                      = "nsg-ci-hub-outbound-001"
      enable_delegation             = false
    },
    "subnet8" = {
      name                          = "snt-ci-hub-bst-001"
      address_prefixes              = ["10.0.8.0/24"]
      skey                          = "vnet1"
      disable_bgp_route_propagation = false
      create_network_security       = true
      create_route_table            = false
      rt_name                       = null
      nsg_name                      = "nsg-ci-hub-bst-001"
      enable_delegation             = false
    },
  }
  tags = {
    application        = "Network"
    environment        = "preprod"
  }
}
