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
}
resource "azurerm_log_analytics_workspace" "log" {
  name                = var.log_name
  location            = local.location
  resource_group_name = local.resource_group_name
  sku                 = var.log_sku
  retention_in_days   = var.retention_in_days
}

resource "azurerm_container_app_environment" "app_env" {
  name                       = var.env_name
  location                   = local.location
  resource_group_name        = local.resource_group_name
  log_analytics_workspace_id = azurerm_log_analytics_workspace.log.id
}
resource "azurerm_container_app" "conatiner" {
  name                         = var.container_name
  container_app_environment_id = azurerm_container_app_environment.app_env.id
  resource_group_name          = local.resource_group_name
  revision_mode                = var.revision_mode

  template {
    container {
      name   = var.image_name
      image  = var.image_id
      cpu    = var.conatiner_cpu
      memory = var.container_memory
    }
  }
  lifecycle {
    ignore_changes = [ template,secret,registry ]
  }
}
