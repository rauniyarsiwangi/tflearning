locals {
  resource_group_name = element(coalescelist(data.azurerm_resource_group.rg.*.name, azurerm_resource_group.rg.*.name, [""]), 0)
  location            = element(coalescelist(data.azurerm_resource_group.rg.*.location, azurerm_resource_group.rg.*.location, [""]), 0)
}

data "azurerm_resource_group" "rg" {
  count = var.create_resource_group == false ? 1 : 0
  name  = var.resource_group_name
}

resource "azurerm_resource_group" "rg" {
  count    = var.create_resource_group == true ? 1 : 0
  location = var.location
  name     = var.resource_group_name
  tags     = var.tags
}
resource "azurerm_storage_account" "storage" {
  name                             = var.storage_account_name
  resource_group_name              = local.resource_group_name
  location                         = local.location
  account_tier                     = var.access_tier
  account_replication_type         = var.account_replication_type
  account_kind                     = var.account_kind
  shared_access_key_enabled        = var.shared_access_key_enabled
  large_file_share_enabled         = var.large_file_share_enabled
  enable_https_traffic_only        = var.enable_https_traffic_only
  public_network_access_enabled    = var.public_network_access_enabled
  is_hns_enabled                   = var.hns_enabled
  tags                             = var.tags
  allow_nested_items_to_be_public  = var.allow_nested_items_to_be_public
  default_to_oauth_authentication  = var.default_to_oauth_authentication
  cross_tenant_replication_enabled = var.cross_tenant_replication_enabled
  custom_domain {
    name = var.custom_domain_name
  }


  dynamic "identity" {
    for_each = var.identity_type == null ? [] : ["enabled"]
    content {
      type         = var.identity_type
      identity_ids = var.identity_ids == "UserAssigned" ? var.identity_ids : null
    }
  }
  dynamic "static_website" {
    for_each = var.static_website == null ? [] : ["enabled"]
    content {
      index_document     = var.static_website.index_document
      error_404_document = var.static_website.error_404_document
    }
  }

  dynamic "network_rules" {
    for_each = var.network_rules != null ? ["true"] : []
    content {
      default_action             = var.network_rules.default_action
      ip_rules                   = var.network_rules.ip_rules
      virtual_network_subnet_ids = data.azurerm_subnet.infra[each.value.skey].id
    }
  }
  depends_on = [
    data.azurerm_resource_group.rg
  ]
  lifecycle {
    ignore_changes = [network_rules, allow_nested_items_to_be_public, static_website, custom_domain, cross_tenant_replication_enabled]
  }
}

resource "azurerm_storage_container" "container" {
  for_each              = var.enable_con == true ? var.containers : {}
  name                  = each.value["name"]
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = each.value["container_access_type"]
}

resource "azurerm_storage_share" "share" {
  for_each             = var.enable_fs == true ? var.fileshare : {}
  name                 = each.value["name"]
  storage_account_name = azurerm_storage_account.storage.name
  quota                = each.value["quota"]
}

# resource "azurerm_storage_table" "table" {
#   for_each             = var.enable_table == true ? var.table : {}
#   name                 = each.value["name"]
#   storage_account_name = azurerm_storage_account.storage.name
# }

# resource "azurerm_storage_queue" "queue" {
#   for_each             = var.enable_queue == true ? var.queue : {}
#   name                 = each.value["name"]
#   storage_account_name = azurerm_storage_account.storage.name
# }

data "azurerm_subnet" "infra" {
  for_each             = var.enable_pe == true || var.network_rules != null && var.attach_vnet == true ? var.subnets : {}
  name                 = each.value["name"]
  resource_group_name  = each.value["resource_group_name"]
  virtual_network_name = each.value["virtual_network_name"]
}

resource "azurerm_private_endpoint" "endpoint" {
  for_each            = var.enable_pe == true ? var.private_endpoint : {}
  name                = each.value["pe_name"]
  location            = local.location
  resource_group_name = local.resource_group_name
  subnet_id           = data.azurerm_subnet.infra[each.key].id

  private_service_connection {
    name                           = each.value["psc_name"]
    is_manual_connection           = false
    private_connection_resource_id = azurerm_storage_account.storage.id
    subresource_names              = each.value["subresource_names"]
  }
  tags = var.tags
}


# resource "azurerm_storage_account_network_rules" "stg_network" {
#   for_each = var.public_network_access_enabled == false && var.enable_pe == false ? var.network_nules : {}
#   storage_account_id = azurerm_storage_account.storage.id
#   default_action             = each.value["default_action"]
#   ip_rules                   = each.value["ip_rules"]
#   virtual_network_subnet_ids = [azurerm_subnet.example.id]
# }
