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

}

#Storage account for the Synapse storage
resource "azurerm_storage_account" "synstg" {
  name                     = var.storage_account.name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.storage_account.account_tier
  account_replication_type = var.storage_account.account_replication_type

  account_kind = lower(var.storage_account.account_tier) == "premium" ? "BlockBlobStorage" : null

  enable_https_traffic_only       = true
  min_tls_version                 = "TLS1_2"
  allow_nested_items_to_be_public = var.storage_account.allow_nested_items_to_be_public

  is_hns_enabled = true

  tags = var.tags
}

resource "azurerm_storage_data_lake_gen2_filesystem" "synstgadls" {
  for_each = toset(var.adls_filesystem)
  name     = each.key

  storage_account_id = azurerm_storage_account.synstg.id
}


# synapse workspace creation
resource "azurerm_synapse_workspace" "synworkspace" {
  name                = format("syn-%s", var.name)
  resource_group_name = var.resource_group_name
  location            = var.location

  identity {
    type = "SystemAssigned"
  }

  storage_data_lake_gen2_filesystem_id = azurerm_storage_data_lake_gen2_filesystem.synstgadls[var.adls_filesystem[0]].id
  sql_administrator_login              = var.sql_administrator.login
  sql_administrator_login_password     = var.sql_administrator.password
  managed_virtual_network_enabled      = true
  purview_id                           = var.purview_id

  # identity {
  #   type = var.type
  # }

  lifecycle {
    ignore_changes = [
      azure_devops_repo[0].last_commit_id
    ]
  }

  tags = var.tags
}
#Synapse firewall rules
resource "azurerm_synapse_firewall_rule" "synfirewall" {
  for_each             = { for fr in var.synapse_firewall_rule : fr.name => fr }
  synapse_workspace_id = azurerm_synapse_workspace.synworkspace.id

  name             = each.value.name
  start_ip_address = each.value.start_ip_address
  end_ip_address   = each.value.end_ip_address
}
# RBAC role Assignment
resource "azurerm_synapse_role_assignment" "roles" {
  for_each = { for ra in var.role_assignment : ra.principal_id => ra }

  synapse_workspace_id = azurerm_synapse_workspace.synworkspace.id
  role_name            = each.value.role_name
  principal_id         = each.value.principal_id
}

resource "azurerm_role_assignment" "synapse_adls" {
  scope                = azurerm_storage_account.synstg.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azurerm_synapse_workspace.synworkspace.identity[0].principal_id
}
#synapse spark pool
resource "azurerm_synapse_spark_pool" "pools" {
  for_each = { for sp in var.synapse_spark_pool : sp.name => sp }

  synapse_workspace_id = azurerm_synapse_workspace.synworkspace.id

  name                           = each.value.name
  node_size_family               = each.value.node_size_family
  node_size                      = each.value.node_size
  node_count                     = each.value.node_count
  cache_size                     = each.value.cache_size
  spark_version                  = each.value.spark_version
  session_level_packages_enabled = each.value.session_level_packages_enabled
  #dynamic_executor_allocation_enabled = each.value.dynamic_executor_allocation_enabled

  dynamic "auto_scale" {
    for_each = each.value.node_count == null ? ["auto_scale"] : []

    content {
      max_node_count = each.value.auto_scale.max_node_count
      min_node_count = each.value.auto_scale.min_node_count
    }
  }

  auto_pause {
    delay_in_minutes = each.value.auto_pause_delay_in_minutes
  }

  dynamic "library_requirement" {
    for_each = each.value.library_requirement != null ? ["enabled"] : []
    content {
      content  = each.value.library_requirement.content
      filename = each.value.library_requirement.filename
    }
  }

  dynamic "spark_config" {
    for_each = each.value.spark_config != null ? ["spark_config"] : []
    content {
      content  = each.value.spark_config.content
      filename = each.value.spark_config.filename
    }
  }

  tags = var.tags

  lifecycle {
    ignore_changes = [
      dynamic_executor_allocation_enabled
    ]
  }
}

#Synapse SQL pool
resource "azurerm_synapse_sql_pool" "sqlpool" {
  for_each             = { for sp in var.dedicated_sql_pool : sp.name => sp }
  name                 = each.value.name
  synapse_workspace_id = azurerm_synapse_workspace.synworkspace.id
  sku_name             = each.value.sku_name
  create_mode          = each.value.create_mode

  tags = var.tags

  depends_on = [
    azurerm_synapse_workspace.synworkspace
  ]
}

# Private Endpoint configuration

resource "azurerm_synapse_managed_private_endpoint" "synpep" {
  for_each             = var.attach_pe  ? { "attach_pe" = "true"} : {}
  name                 = var.synpep_name
  synapse_workspace_id = azurerm_synapse_workspace.synworkspace.id
  target_resource_id   = azurerm_storage_account.synstg.id
  subresource_name     = "blob"
  depends_on = [azurerm_synapse_firewall_rule.synfirewall]
}
