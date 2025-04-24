#------------------------------------------
# Module for Vnet
#------------------------------------------
module "vnet-ci-hub-prd-net-01" {
  source                = "../../../tfs-modules/azurerm_virtual_network"
  create_resource_group = false
  resource_group_name   = "rsg-ci-hub-prd-net-01"
  location              = "Central India"
  address_space = {
    "vnet1" = {
      name          = "vnet-ci-hub-prd-net-01"
      address_space = ["10.10.0.0/20"]
    },
  }
  subnet_prefixes = {
    "subnet1" = {
      name                          = "GatewaySubnet"
      address_prefixes              = ["10.10.0.0/25"]
      skey                          = "vnet1"
      disable_bgp_route_propagation = false
      create_network_security       = false
      create_route_table            = true
      rt_name                       = "rtb-GatewaySubnet"
      nsg_name                      = null
      enable_delegation             = false
    },
    "subnet2" = {
      name                          = "snt-ci-hub-prd-shs-01"
      address_prefixes              = ["10.10.1.0/24"]
      skey                          = "vnet1"
      disable_bgp_route_propagation = false
      create_network_security       = false
      create_route_table            = true
      rt_name                       = "rtb-ci-hub-prd-shs-01"
      nsg_name                      = null
      enable_delegation             = false
    },
    "subnet3" = {
      name                          = "AzureBastionSubnet"
      address_prefixes              = ["10.10.0.128/26"]
      skey                          = "vnet1"
      disable_bgp_route_propagation = false
      create_network_security       = false
      create_route_table            = false
      rt_name                       = null
      nsg_name                      = null
      enable_delegation             = false
    },
    "subnet4" = {
      name                          = "snt-ci-hub-prd-stargate-01"
      address_prefixes              = ["10.10.0.192/26"]
      skey                          = "vnet1"
      disable_bgp_route_propagation = false
      create_network_security       = true
      create_route_table            = true
      rt_name                       = "rtb-ci-hub-prd-stargate-01"
      nsg_name                      = "nsg-ci-hub-prd-stargate-01"
      enable_delegation             = false
    },
    "subnet5" = {
      name                          = "snt-ci-hub-prd-identity-01"
      address_prefixes              = ["10.10.2.0/25"]
      skey                          = "vnet1"
      disable_bgp_route_propagation = false
      create_network_security       = true
      create_route_table            = true
      rt_name                       = "rtb-ci-hub-prd-identity-01"
      nsg_name                      = "nsg-ci-hub-prd-identity-01"
      enable_delegation             = false
    },
    "subnet6" = {
      name                          = "AzureFirewallSubnet"
      address_prefixes              = ["10.10.2.128/26"]
      skey                          = "vnet1"
      disable_bgp_route_propagation = false
      create_network_security       = false
      create_route_table            = false
      rt_name                       = null
      nsg_name                      = null
      enable_delegation             = false
    },

  }
  tags = {
    application = "Network"
    environment = "hub"
  }
}
