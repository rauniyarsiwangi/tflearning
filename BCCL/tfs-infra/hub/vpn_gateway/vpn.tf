module "vpn_gateway" {
  source              = "../../../tfs-modules/azurerm_virtual_network_gateway"
  resource_group_name = "rsg-ci-hub-prd-net-01"
  location            = "Central india"
  vnet_name           = "vnet-ci-hub-prd-net-01"
  vng_config = {
    name                  = "vpn-ci-hub-prd-gateway-01"
    pip_allocation_method = "Static"
    public_ip_sku         = "Standard"
    type                  = "Vpn"
    generation            = "Generation2"
    sku                   = "VpnGw4"
    active_active         = false
    tags                  = {}
  }
}
