locals {
  resource_group_name = element(coalescelist(data.azurerm_resource_group.infra.*.name, azurerm_resource_group.infra.*.name, [""]), 0)
  location            = element(coalescelist(data.azurerm_resource_group.infra.*.location, azurerm_resource_group.infra.*.location, [""]), 0)
}

data "azurerm_resource_group" "infra" {
  count = var.create_resource_group == false ? 1 : 0
  name  = var.resource_group_name
}

resource "azurerm_resource_group" "infra" {
  count    = var.create_resource_group ? 1 : 0
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

# data "azurerm_virtual_network" "infra" {
#   name                = var.vnet_name
#   resource_group_name = var.vnet_rg_name
# }
# data "azurerm_subnet" "infra" {
#   name                 = var.subnet_name
#   virtual_network_name = var.vnet_name
#   resource_group_name  = var.vnet_rg_name
# }
# resource "azurerm_public_ip" "example" {
#   name                = var.azurerm_public_ip
#   sku                 = "Standard"
#   location            = var.resource_group_location
#   resource_group_name = var.resource_group_name
#   allocation_method   = "Static"
# }

# data "azurerm_private_dns_zone" "infra" {
#   name                = var.pvt_dns_zone_name
#   resource_group_name = var.vnet_rg_name
# }
# resource "azurerm_private_endpoint" "infra" {
#   count               = var.enable_private_endpoint == true ? 1 : 0
#   name                = var.private_endpoint
#   location            = local.location
#   resource_group_name = var.vnet_rg_name
#   subnet_id           = data.azurerm_subnet.infra.id
#   tags                = var.tags

#   private_service_connection {
#     name                           = var.private_service_connection
#     is_manual_connection           = false
#     private_connection_resource_id = azurerm_mariadb_server.infra.id
#     subresource_names              = ["mariadbServer"]
#   }
#   depends_on = [
#     azurerm_mariadb_server.infra
#   ]
# }

# data "azurerm_private_endpoint_connection" "example" {
#   count               = var.enable_private_endpoint == true ? 1 : 0
#   name                = var.private_endpoint
#   resource_group_name = var.vnet_rg_name
#   depends_on = [
#     data.azurerm_resource_group.infra, azurerm_private_endpoint.infra
#   ]
# }

# resource "azurerm_private_dns_a_record" "arecord1" {
#   name                = var.mariadb_server_name
#   zone_name           = data.azurerm_private_dns_zone.infra.name
#   resource_group_name = var.vnet_rg_name
#   ttl                 = 300
#   records             = [data.azurerm_private_endpoint_connection.example.0.private_service_connection.0.private_ip_address]
# }

# data "azurerm_client_config" "current" {}


# data "azurerm_key_vault" "mariadb" {
#   name                = var.kv_pointer_name
#   resource_group_name = var.kv_pointer_rg
# }

# resource "random_password" "mariadb" {
#   length  = 16
#   special = false
# }
# #Create Key Vault Secret
# resource "azurerm_key_vault_secret" "mariadb" {
#   name         = var.mariadb_server_name
#   value        = random_password.mariadb.result
#   key_vault_id = data.azurerm_key_vault.mariadb.id
# }

resource "azurerm_mariadb_server" "infra" {
  name                         = var.mariadb_server_name
  location                     = local.location
  resource_group_name          = var.resource_group_name
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password
  sku_name                     = var.sku
  storage_mb                   = var.size_mb
  version                      = var.ser_version
  auto_grow_enabled            = true
  backup_retention_days        = var.bkp_retention_days
  # geo_redundant_backup_enabled    = false
  # public_network_access_enabled   = true
  
  ssl_enforcement_enabled        = false

  # Set ssl_minimal_tls_version_enforced to "TLSEnforcementDisabled" if ssl_enforcement_enabled is set to false
  ssl_minimal_tls_version_enforced = var.ssl_enforcement_enabled ? null : "TLSEnforcementDisabled"
}
#------------------------------------------------------------
# Adding Firewall rules for MariaDB Server - Default is "false"
#------------------------------------------------------------
resource "azurerm_mariadb_firewall_rule" "main" {
  for_each            = var.firewall_rules != null ? var.firewall_rules : {}
  name                = each.value["name"]
  resource_group_name = local.resource_group_name
  # allow_access_to_azure_services = true
  server_name         = azurerm_mariadb_server.infra.name
  start_ip_address    = each.value["start_ip_address"]
  end_ip_address      = each.value["end_ip_address"]
}

