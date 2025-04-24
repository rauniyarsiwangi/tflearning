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

# data "azurerm_log_analytics_workspace" "logws" {
#   count               = var.log_analytics_workspace_name != null ? 1 : 0
#   name                = var.log_analytics_workspace_name
#   resource_group_name = local.resource_group_name
#   depends_on = [
#     azurerm_resource_group.example
#   ]
# }

#---------------------------------------------------------------
# Storage Account to keep logs and backups - Default is "false"
#----------------------------------------------------------------

# data "azurerm_storage_account" "stg" {
#   name                = var.storage_account_name
#   resource_group_name = var.stg_rg_name
# }

#------------------------------------------------------------
# Redis Cache Instance configuration - Default (required). 
#------------------------------------------------------------

resource "azurerm_redis_cache" "main" {
  name                          = var.redis_server_settings.name
  resource_group_name           = local.resource_group_name
  location                      = var.location
  capacity                      = var.redis_server_settings.capacity
  family                        = var.redis_server_settings.family
  redis_version                 = var.redis_server_settings.redis_version
  sku_name                      = var.redis_server_settings.sku_name
  enable_non_ssl_port           = var.redis_server_settings.enable_non_ssl_port
  minimum_tls_version           = var.redis_server_settings.minimum_tls_version
  public_network_access_enabled = var.redis_server_settings.public_network_access_enabled
  replicas_per_master           = var.redis_server_settings.sku_name == "Premium" ? var.redis_server_settings.replicas_per_master : null
  shard_count                   = var.redis_server_settings.sku_name == "Premium" ? var.redis_server_settings.shard_count : 0
  zones                         = var.redis_server_settings.sku_name == "Premium" ? var.redis_server_settings.zones : null
  tags                          = var.tags

  redis_configuration {
    enable_authentication           = lookup(var.redis_configuration, "enable_authentication", true)
    maxfragmentationmemory_reserved = var.redis_server_settings.sku_name == "Premium" || var.redis_server_settings.sku_name == "Standard" ? lookup(var.redis_configuration, "maxfragmentationmemory_reserved") : null
    maxmemory_delta                 = var.redis_server_settings.sku_name == "Premium" || var.redis_server_settings.sku_name == "Standard" ? lookup(var.redis_configuration, "maxmemory_delta") : null
    maxmemory_policy                = lookup(var.redis_configuration, "maxmemory_policy")
    maxmemory_reserved              = var.redis_server_settings.sku_name == "Premium" || var.redis_server_settings.sku_name == "Standard" ? lookup(var.redis_configuration, "maxmemory_reserved") : null
    notify_keyspace_events          = lookup(var.redis_configuration, "notify_keyspace_events")
    # rdb_backup_enabled              = var.redis_server_settings.sku_name == "Basic" ? null : true
    # rdb_backup_frequency            = var.redis_server_settings.sku_name == "Basic" ? null : var.data_persistence_backup_frequency
    # rdb_backup_max_snapshot_count   = var.redis_server_settings.sku_name == "Basic" ? null : var.data_persistence_backup_max_snapshot_count
    # rdb_storage_connection_string   = var.redis_server_settings.sku_name == "Basic" ? null : data.azurerm_storage_account.stg.primary_blob_connection_string
  }

  dynamic "patch_schedule" {
    for_each = var.patch_schedule != null ? [var.patch_schedule] : []
    content {
      day_of_week    = var.patch_schedule.day_of_week
      start_hour_utc = var.patch_schedule.start_hour_utc
    }
  }

  lifecycle {
    # A bug in the Redis API where the original storage connection string isn't being returned
    ignore_changes = [redis_configuration.0.rdb_storage_connection_string]
  }
}


#----------------------------------------------------------------------
#Adding Firewall rules for Redis Cache Instance - Default is "false"
#----------------------------------------------------------------------
resource "azurerm_redis_firewall_rule" "name" {
  for_each            = var.firewall_rules != null ? { for k, v in var.firewall_rules : k => v if v != null } : {}
  name                = format("%s", each.key)
  redis_cache_name    = azurerm_redis_cache.main.name
  resource_group_name = local.resource_group_name
  start_ip            = each.value["start_ip"]
  end_ip              = each.value["end_ip"]
}


#---------------------------------------------------------
# Private Link for Redis Server - Default is "false" 
#---------------------------------------------------------
# data "azurerm_virtual_network" "vnet01" {
#   count               = var.enable_private_endpoint ? 1 : 0
#   name                = var.virtual_network_name
#   resource_group_name = local.resource_group_name
#   depends_on = [azurerm_resource_group.example]
# }

# data "azurerm_subnet" "infra" {
#   name                 = var.subnet_name
#   virtual_network_name = var.vnet_name
#   resource_group_name  = var.vnet_rg_name
# }

# data "azurerm_private_dns_zone" "infra" {
#   name                = var.pvt_dns_zone_name
#   resource_group_name = var.pvt_rg_name
# }

# resource "azurerm_private_endpoint" "infra" {
#   count               = var.redis_server_settings.sku_name == "Standard" || var.redis_server_settings.sku_name == "Basic" || var.redis_server_settings.sku_name == "Premium" ? 1 : 0
#   name                = var.pe_resource_name
#   location            = var.location
#   resource_group_name = local.resource_group_name
#   subnet_id           = data.azurerm_subnet.infra.id
#   tags                = var.tags
#   private_dns_zone_group {
#     name                 = var.redis_instance_name
#     private_dns_zone_ids = [data.azurerm_private_dns_zone.infra.id]
#   }

#   private_service_connection {
#     name                           = var.pse_resource_name
#     is_manual_connection           = false
#     private_connection_resource_id = azurerm_redis_cache.main.id
#     subresource_names              = ["redisCache"]
#   }
# }

# data "azurerm_private_endpoint_connection" "example" {
#   count               = var.redis_server_settings.sku_name == "Standard" || var.redis_server_settings.sku_name == "Basic" || var.redis_server_settings.sku_name == "Premium" ? 1 : 0
#   name                = var.pe_resource_name
#   resource_group_name = local.resource_group_name
#   depends_on = [
#     data.azurerm_resource_group.infra, azurerm_resource_group.infra, azurerm_redis_cache.main, azurerm_private_endpoint.infra
#   ]
# }

# resource "azurerm_private_dns_a_record" "arecord1" {
#   count               = var.redis_server_settings.sku_name == "Standard" || var.redis_server_settings.sku_name == "Basic" || var.redis_server_settings.sku_name == "Premium" ? 1 : 0
#   name                = var.redis_instance_name
#   zone_name           = data.azurerm_private_dns_zone.infra.name
#   resource_group_name = var.pvt_rg_name
#   ttl                 = 300
#   records             = [data.azurerm_private_endpoint_connection.example[count.index].private_service_connection.0.private_ip_address]
# }
