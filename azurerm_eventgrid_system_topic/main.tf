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
data "azurerm_storage_account" "eventgrid" {
  count               = var.storage_account_name == null ? 0 : 1
  name                = var.storage_account_name
  resource_group_name = var.storage_rg_name
}


resource "azurerm_eventgrid_system_topic" "eventgrid" {
  name                   = var.eventgrid_topic_name
  resource_group_name    = local.resource_group_name
  location               = local.location
  source_arm_resource_id = var.storage_account_name == null ? var.resource_id : data.azurerm_storage_account.eventgrid.0.id
  topic_type             = var.topic_type
  tags                   = var.tags
}
