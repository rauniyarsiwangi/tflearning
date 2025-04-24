locals {
  resource_group_name = element(coalescelist(data.azurerm_resource_group.infra.*.name, azurerm_resource_group.infra.*.name, [""]), 0)
  location            = element(coalescelist(data.azurerm_resource_group.infra.*.location, azurerm_resource_group.infra.*.location, [""]), 0)
}

data "azurerm_resource_group" "infra" {
  count = var.create_resource_group == false ? 1 : 0
  name  = var.resource_group_name
}

resource "azurerm_resource_group" "infra" {
  count    = var.create_resource_group == true ? 1 : 0
  location = var.resource_group_location
  name     = var.resource_group_name
  tags     = var.tags
}

data "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  resource_group_name = var.vnet_rg_name
}

data "azurerm_subnet" "infra" {
  name                 = var.subnet_name
  virtual_network_name = var.vnet_name
  resource_group_name  = var.vnet_rg_name
}

data "azurerm_private_dns_zone" "dns" {
  provider            = azurerm.dest
  name                = "private.postgres.database.azure.com"
  resource_group_name = "rsg-ci-inf-prd-pvtdns-01"
}

# resource "azurerm_private_dns_zone_virtual_network_link" "vnetlink" {
#   name                  = "vnet-dns-link"
#   resource_group_name   = local.resource_group_name
#   private_dns_zone_name = data.azurerm_private_dns_zone.dns.name
#   virtual_network_id    = data.azurerm_virtual_network.vnet.id
# }

# Manages the PSQL Flexible Server
resource "azurerm_postgresql_flexible_server" "infra" {
  name                   = var.mypostgre_fs_name
  resource_group_name    = local.resource_group_name
  location               = var.resource_group_location
  version                = var.server_ver
  delegated_subnet_id    = data.azurerm_subnet.infra.id
  administrator_login    = var.admin_username
  administrator_password = var.admin_password
  zone                   = var.server_zone
  storage_mb             = var.size_mb
  sku_name               = var.sku
  backup_retention_days  = var.bkp_retention_days
  private_dns_zone_id    = data.azurerm_private_dns_zone.dns.id
  tags                   = var.tags
  maintenance_window {}
  lifecycle {
    ignore_changes = [zone]
  }
}



