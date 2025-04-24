locals {
  resource_group_name = element(coalescelist(data.azurerm_resource_group.rg.*.name, azurerm_resource_group.rg.*.name, [""]), 0)
  location            = element(coalescelist(data.azurerm_resource_group.rg.*.location, azurerm_resource_group.rg.*.location, [""]), 0)
  #  availability_set_id = element(coalescelist(data.azurerm_availability_set.as.*.id, azurerm_availability_set.as.*.id, [""]), 0)
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

resource "azurerm_logic_app_workflow" "logicapp" {
  name                = var.app_name
  location            = local.location
  resource_group_name = local.resource_group_name
  enabled             = var.enabled == true ? true : var.enabled
  workflow_version    = var.workflow_version == "" ? "1.0.0.0" : var.workflow_version
  tags                = var.tags
  identity {
    type = "SystemAssigned"
  }
  lifecycle {
    ignore_changes = [parameters, workflow_parameters,identity]
  }
}
