#------------------------------------------
# Local variables
#------------------------------------------
locals {
  resource_group_name = element(coalescelist(data.azurerm_resource_group.rgrp.*.name, azurerm_resource_group.rg.*.name, [""]), 0)
  location            = element(coalescelist(data.azurerm_resource_group.rgrp.*.location, azurerm_resource_group.rg.*.location, [""]), 0)
}

#------------------------------------------
# Resource Group
#------------------------------------------
data "azurerm_resource_group" "rgrp" {
  count = var.create_resource_group == false ? 1 : 0
  name  = var.resource_group_name
}

resource "azurerm_resource_group" "rg" {
  count    = var.create_resource_group ? 1 : 0
  name     = lower(var.resource_group_name)
  location = var.location
  tags     = var.tags
}

resource "azurerm_user_assigned_identity" "user_identity" {
  count               = var.use_system_assigned_identity == true ? 0 : 1
  resource_group_name = var.resource_group_name == null ? local.resource_group_name : var.resource_group_name
  location            = local.location
  name                = var.user_name
}


# data "azurerm_subnet" "subnet" {
#   provider             = azurerm.existing_sub
#   for_each             = var.vnet_integration_enabled == true ? var.subnets : {}
#   name                 = each.value["name"]
#   virtual_network_name = each.value["virtual_network_name"]
#   resource_group_name  = each.value["resource_group_name"]
# }

resource "azurerm_mssql_server" "sql_server" {
  name                         = var.server_name
  resource_group_name          = local.resource_group_name
  location                     = local.location
  version                      = var.server_ver
  administrator_login          = var.admin_username == null ? "sqladmin" : var.admin_username
  administrator_login_password = var.admin_password == null ? "Pa55w.rd123" : var.admin_password
  minimum_tls_version          = var.minimum_tls_version == "" ? "1.2" : var.minimum_tls_version
  tags                         = var.tags

  dynamic "azuread_administrator" {
    for_each = var.ad_admin_enabled == true ? { "ad_admin_enabled" = "true" } : {}
    content {
      login_username = var.user_name
      object_id      = var.object_id
    }
  }
  lifecycle {
    ignore_changes = [identity]
  }
}

resource "azurerm_mssql_firewall_rule" "sql_firewall" {
  for_each         = var.firewall_rules != null ? { for k, v in var.firewall_rules : k => v if v != null } : {}
  name             = each.value["name"]
  server_id        = azurerm_mssql_server.sql_server.id
  start_ip_address = each.value["start_ip_address"]
  end_ip_address   = each.value["end_ip_address"]
}

resource "azurerm_mssql_database" "database" {
  for_each             = var.create_database == true ? var.database : {}
  name                 = each.value["name"]
  server_id            = azurerm_mssql_server.sql_server.id
  collation            = each.value["collation"]
  sku_name             = each.value["sku_name"]
  zone_redundant       = each.value["zone_redundant"]
  storage_account_type = each.value["storage_account_type"]
  max_size_gb          = each.value["max_size_gb"]
  tags                 = var.tags
}

resource "azurerm_private_endpoint" "private_endpoint" {
  count                         = var.private_endpoint_enabled ? 1 : 0
  name                          = "${var.server_name}-pep"
  location                      = local.location
  resource_group_name           = local.resource_group_name
  subnet_id                     = var.private_endpoint_subnet_id
  custom_network_interface_name = var.custom_network_interface_name
  private_service_connection {
    name                           = "${var.server_name}-psc"
    is_manual_connection           = false
    private_connection_resource_id = azurerm_mssql_server.sql_server.id
    subresource_names              = ["sqlServer"]
  }
  ip_configuration {
    name               = "${var.server_name}-ipconfig"
    private_ip_address = var.private_ip_address
    subresource_name   = "sqlServer"
  }
  tags = var.tags
  lifecycle {
    ignore_changes = [private_dns_zone_group]
  }
}

# resource "azurerm_mssql_virtual_network_rule" "vnet_rule" {
#   for_each  = var.vnet_integration_enabled ? var.vnets : {}
#   name      = each.value["name"]
#   server_id = azurerm_mssql_server.sql_server.id
#   subnet_id = data.azurerm_subnet.subnet[each.key].id
# }


# resource "azurerm_virtual_network_service_endpoint" "vnet_service_endpoint" {
#   for_each             = var.vnet_integration_enabled ? var.vnets : {}
#   name                 = each.value["name"]
#   resource_group_name  = local.resource_group_name
#   virtual_network_name = each.value["virtual_network_name"]
#   subnet_name          = each.value["subnet_name"]
# }

# resource "azurerm_subnet_service_endpoint_policy" "subnet_service_endpoint_policy" {
#   for_each                    = var.vnet_integration_enabled == true ? var.policy : {}
#   name                        = each.value["name"]
#   resource_group_name         = local.resource_group_name
#   subnet_id                   = each.value["subnet_id"]
#   service_endpoint_policy_ids = [azurerm_virtual_network_service_endpoint.vnet_service_endpoint[each.value.vkey].id]
# }
