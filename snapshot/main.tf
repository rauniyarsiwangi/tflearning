locals {
  resource_group_name = element(coalescelist(data.azurerm_resource_group.vm.*.name, azurerm_resource_group.vm.*.name, [""]), 0)
  location            = element(coalescelist(data.azurerm_resource_group.vm.*.location, azurerm_resource_group.vm.*.location, [""]), 0)
}

data "azurerm_resource_group" "vm" {
  count = var.create_resource_group == false ? 1 : 0
  name  = var.resource_group_name
}

resource "azurerm_resource_group" "vm" {
  count    = var.create_resource_group == true ? 1 : 0
  location = var.location
  name     = var.resource_group_name
}

data "azurerm_managed_disk" "os_disk" {
  provider            = azurerm.source
  name                = var.managed_disk_name
  resource_group_name = var.managed_disk_rg
}

resource "azurerm_snapshot" "ossnapshot" {
  provider            = azurerm.dest
  name                = var.snapshot_name
  location            = local.location
  resource_group_name = local.resource_group_name
  create_option       = "Copy"
  source_resource_id  = data.azurerm_managed_disk.os_disk.id
}

data "azurerm_managed_disk" "data_disk" {
  provider            = azurerm.source
  for_each            = var.existing_data_disk == true ? var.dd_config : {}
  name                = each.value["name"]
  resource_group_name = each.value["resource_group_name"]
}

resource "azurerm_snapshot" "dd_config" {
  provider            = azurerm.dest
  for_each            = var.existing_data_disk == true ? var.dd_config : {}
  name                = each.value["dd_name"]
  location            = local.location
  resource_group_name = local.resource_group_name
  create_option       = "Copy"
  source_resource_id  = data.azurerm_managed_disk.data_disk[each.key].id
}
