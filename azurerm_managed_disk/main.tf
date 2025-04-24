locals {
  resource_group_name = element(coalescelist(data.azurerm_resource_group.vm.*.name, azurerm_resource_group.vm.*.name, [""]), 0)
  location            = element(coalescelist(data.azurerm_resource_group.vm.*.location, azurerm_resource_group.vm.*.location, [""]), 0)
  #  availability_set_id = element(coalescelist(data.azurerm_availability_set.as.*.id, azurerm_availability_set.as.*.id, [""]), 0)
}

data "azurerm_resource_group" "vm" {
  count = var.create_resource_group == false ? 1 : 0
  name  = var.resource_group_name
}

resource "azurerm_resource_group" "vm" {
  count    = var.create_resource_group == true ? 1 : 0
  location = var.location
  name     = var.resource_group_name
  tags     = var.tags
}

data "azurerm_snapshot" "snapshot" {
  provider            = azurerm.source
  name                = var.snapshot_name
  resource_group_name = var.snapshot_rg
}

resource "azurerm_managed_disk" "os_disk" {
  provider             = azurerm.dest
  name                 = var.os_disk_name
  location             = local.location
  resource_group_name  = local.resource_group_name
  storage_account_type = var.stg_acc_type
  create_option        = "Copy"
  source_resource_id   = data.azurerm_snapshot.snapshot.id

  lifecycle {
    ignore_changes = [
      hyper_v_generation, os_type
    ]
  }
  tags = var.tags
}


data "azurerm_snapshot" "data_disk" {
  provider            = azurerm.source
  for_each            = var.existing_data_disk == true ? var.dd_config : {}
  name                = each.value["name"]
  resource_group_name = each.value["resource_group_name"]
}

resource "azurerm_managed_disk" "data_disk" {
  provider             = azurerm.dest
  for_each             = var.existing_data_disk == true ? var.dd_config : {}
  name                 = each.value["dd_name"]
  location             = local.location
  resource_group_name  = local.resource_group_name
  storage_account_type = each.value["stg_acc_type"]
  create_option        = "Copy"
  source_resource_id   = data.azurerm_snapshot.data_disk[each.key].id
  tags                 = var.tags
}
