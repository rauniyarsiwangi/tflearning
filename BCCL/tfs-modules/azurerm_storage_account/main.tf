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
  location = var.resource_group_location
  name     = var.resource_group_name
}
resource "azurerm_storage_account" "storage" {
  name                          = var.storage_account_name
  resource_group_name           = local.resource_group_name
  location                      = local.location
  account_tier                  = var.access_tier
  account_replication_type      = var.account_replication_type
  account_kind                  = var.account_kind
  shared_access_key_enabled     = var.shared_access_key_enabled
  large_file_share_enabled      = var.account_kind != "BlockBlobStorage"
  enable_https_traffic_only     = var.enable_https_traffic_only
  public_network_access_enabled = var.public_network_access_enabled
  is_hns_enabled                = var.hns_enabled
  tags                          = var.tags

  dynamic "identity" {
    for_each = var.managed_identity_type != null ? [1] : []
    content {
      type         = var.managed_identity_type
      identity_ids = var.managed_identity_type == "UserAssigned" || var.managed_identity_type == "SystemAssigned, UserAssigned" ? var.managed_identity_ids : null
    }
  }
  dynamic "static_website" {
    for_each = var.static_website == null ? [] : ["enabled"]
    content {
      index_document     = var.static_website.index_document
      error_404_document = var.static_website.error_404_document
    }
  }
  depends_on = [
    data.azurerm_resource_group.rg
  ]
}
resource "azurerm_storage_container" "container" {
  for_each              = try({ for c in var.container : c.name => c }, {})
  storage_account_name  = azurerm_storage_account.storage.name
  name                  = each.key
  container_access_type = coalesce(each.value.container_access_type, "blob")
}

resource "azurerm_storage_management_policy" "lcpolicy" {
  count              = length(var.lifecycles) == 0 ? 0 : 1
  storage_account_id = azurerm_storage_account.storage.id

  rule {
    name    = var.rule_name
    enabled = true
    filters {
      prefix_match = []
      blob_types   = ["blockBlob", "appendBlob"]
    }
    actions {
      base_blob {
        delete_after_days_since_modification_greater_than = 60
      }
      snapshot {
        delete_after_days_since_creation_greater_than = 60
      }
    }
  }
}


data "azurerm_subnet" "infra" {
  count                = var.enable_private_endpoint == true ? 1 : 0
  name                 = var.subnet_name
  resource_group_name  = var.vnet_rg_name
  virtual_network_name = var.vnet_name
}

resource "azurerm_private_endpoint" "pep1" {
  count               = var.enable_private_endpoint == true ? 1 : 0
  name                = var.private_service_connection_name
  location            = var.resource_group_location
  resource_group_name = var.vnet_rg_name
  subnet_id           = data.azurerm_subnet.infra.0.id

  private_dns_zone_group {
    name                 = var.pvt_dns_zone_name
    private_dns_zone_ids = [data.azurerm_private_dns_zone.infra.0.id]
  }

  private_service_connection {
    name                           = var.private_service_connection_name
    is_manual_connection           = false
    private_connection_resource_id = azurerm_storage_account.storage.id
    subresource_names              = var.sub_resource_name
  }
  depends_on = [
    azurerm_storage_account.storage
  ]
}

data "azurerm_private_dns_zone" "infra" {
  count               = var.enable_private_endpoint == true ? 1 : 0
  name                = var.pvt_dns_zone_name
  resource_group_name = var.vnet_rg_name
}


