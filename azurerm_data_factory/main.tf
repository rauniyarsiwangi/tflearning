locals {
  resource_group_name = element(coalescelist(data.azurerm_resource_group.rgrp.*.name, azurerm_resource_group.rg.*.name, [""]), 0)
  location            = element(coalescelist(data.azurerm_resource_group.rgrp.*.location, azurerm_resource_group.rg.*.location, [""]), 0)
}
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
  name                = "user-identity"
}
resource "azurerm_data_factory" "main" {
  name                            = var.df_name
  location                        = local.location
  resource_group_name             = var.resource_group_name == null ? local.resource_group_name : var.resource_group_name
  managed_virtual_network_enabled = var.managed_virtual_network_enabled
  public_network_enabled          = var.public_network_enabled
  tags                            = var.tags


  dynamic "github_configuration" {
    for_each = var.github_configuration != null ? [var.github_configuration] : []
    content {
      git_url         = github_configuration.value.git_url
      account_name    = github_configuration.value.account_name
      branch_name     = github_configuration.value.branch_name
      repository_name = github_configuration.value.repository_name
      root_folder     = github_configuration.value.root_folder
    }
  }

  dynamic "global_parameter" {
    for_each = var.global_parameters
    content {
      name  = global_parameter.key
      type  = global_parameter.value.type
      value = global_parameter.value.value
    }
  }

  identity {
    type         = var.use_system_assigned_identity == true ? "SystemAssigned" : "UserAssigned"
    identity_ids = var.use_system_assigned_identity == true ? null : [azurerm_user_assigned_identity.user_identity[0].id]
  }

}


# Create user-assigned managed identity if required

# Grant data factory access to the user-assigned identity if required
resource "azurerm_role_assignment" "role_assign" {
  count                = var.use_system_assigned_identity == true ? 0 : 1
  scope                = azurerm_data_factory.main.id
  role_definition_name = "Contributor"
  principal_id         = azurerm_user_assigned_identity.user_identity[count.index].principal_id

}

