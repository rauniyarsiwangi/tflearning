locals {
  resource_group_name = element(coalescelist(data.azurerm_resource_group.vm.*.name, azurerm_resource_group.vm.*.name, [""]), 0)
  location            = element(coalescelist(data.azurerm_resource_group.vm.*.location, azurerm_resource_group.vm.*.location, [""]), 0)
}

data "azurerm_resource_group" "vm" {
  count = var.create_resource_group == false ? 1 : 0
  name  = var.resource_group_name
}

resource "azurerm_resource_group" "vm" {
  count    = var.create_resource_group == true ? 1 : 0
  location = var.location
  name     = var.resource_group_name
}

data "azurerm_subnet" "snet" {
  name                 = var.subnet_name
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.vnet_rg_name
}

resource "azurerm_public_ip" "pip" {
  name                = var.pip_name
  location            = local.location
  resource_group_name = local.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
  zones               = ["1", "2", "3"]
}

resource "azurerm_firewall" "firewall" {
  name                = var.fw_name
  location            = local.location
  resource_group_name = local.resource_group_name
  sku_name            = var.fw_sku_name
  sku_tier            = var.fw_sku_tier
  zones               = ["1", "2", "3"]
  firewall_policy_id  = azurerm_firewall_policy.policy.id

  ip_configuration {
    name                 = "configuration"
    subnet_id            = data.azurerm_subnet.snet.id
    public_ip_address_id = azurerm_public_ip.pip.id
  }
  lifecycle {
    ignore_changes = [ip_configuration, dns_servers, virtual_hub]
  }
  depends_on = [azurerm_firewall_policy.policy]
}

resource "azurerm_firewall_policy" "policy" {
  name                = var.fw_policy_name
  resource_group_name = local.resource_group_name
  location            = local.location
  sku                 = var.fw_policy_sku
  dns {
    proxy_enabled = var.proxy_enabled
    servers       = var.servers
  }

  lifecycle {
    ignore_changes = [dns, identity, insights, intrusion_detection, threat_intelligence_allowlist, explicit_proxy]
  }
}
