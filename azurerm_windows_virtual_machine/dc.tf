locals {
  resource_group_name = element(coalescelist(data.azurerm_resource_group.rgrp.*.name, azurerm_resource_group.rg.*.name, [""]), 0)
  location            = element(coalescelist(data.azurerm_resource_group.rgrp.*.location, azurerm_resource_group.rg.*.location, [""]), 0)
}
#------------------------------------------
# Virtual Networks
#------------------------------------------
data "azurerm_resource_group" "rgrp" {
  count = var.create_resource_group == false ? 1 : 0
  name  = var.resource_group_name
}

resource "azurerm_resource_group" "rg" {
  count    = var.create_resource_group ? 1 : 0
  name     = lower(var.resource_group_name)
  location = var.location
}

data "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  virtual_network_name = var.vnet_name
  resource_group_name  = var.vnet_rg_name
}

resource "azurerm_public_ip" "pip" {
  for_each            = var.create_public_ip ? toset(["public_ip"]) : toset([])
  name                = var.public_ip_name
  location            = local.location
  resource_group_name = local.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
  # domain_name_label   = "${var.vm_name}-publicip"
  tags = var.tags
}

resource "azurerm_network_interface" "nic" {
  for_each            = var.create_public_ip ? toset(["network_interface"]) : toset(["network_interface"])
  name                = var.nic_name
  resource_group_name = local.resource_group_name
  location            = local.location

  ip_configuration {
    name                          = data.azurerm_subnet.subnet.name
    subnet_id                     = data.azurerm_subnet.subnet.id
    private_ip_address_allocation = var.pip_add_allocation
    private_ip_address            = var.private_ip_address
    public_ip_address_id          = var.create_public_ip == true ? azurerm_public_ip.pip[each.key].id : null
  }

  lifecycle {
    ignore_changes = [
      ip_configuration
    ]
  }
}

resource "azurerm_windows_virtual_machine" "vm" {
  for_each                 = var.vm_config
  name                     = each.value["name"]
  resource_group_name      = local.resource_group_name
  location                 = local.location
  size                     = each.value["size"]
  computer_name            = each.value["computer_name"]
  admin_username           = each.value["admin_username"]
  admin_password           = each.value["admin_password"]
  provision_vm_agent       = each.value["provision_vm_agent"]
  enable_automatic_updates = each.value["enable_automatic_updates"]
  network_interface_ids = [
    azurerm_network_interface.nic["network_interface"].id,
  ]
  license_type        = each.value["license_type"]
  availability_set_id = each.value["availability_set_id"]
  zone                = each.value["zone"]

  os_disk {
    name                 = "${var.os_disk_name}-osdisk"
    caching              = var.caching_type
    storage_account_type = var.disk_type
    disk_size_gb         = var.os_disk_size_gb
  }
  source_image_reference {
    publisher = var.os_publisher
    offer     = var.os_offer
    sku       = var.os_sku
    version   = var.image_version
  }
  tags = var.tags
}


resource "azurerm_managed_disk" "data_disk" {
  for_each             = var.create_data_disk ? var.data_disk_config : {}
  name                 = each.value["name"]
  location             = local.location
  resource_group_name  = local.resource_group_name
  storage_account_type = each.value["storage_account_type"]
  create_option        = "Empty"
  disk_size_gb         = each.value["disk_size_gb"]
  zone                 = each.value["zone"]
}

resource "azurerm_virtual_machine_data_disk_attachment" "vm" {
  for_each           = var.create_data_disk ? var.data_disk_config : {}
  managed_disk_id    = azurerm_managed_disk.data_disk[each.key].id
  virtual_machine_id = azurerm_windows_virtual_machine.vm[each.value.vmkey].id
  lun                = each.value["lun"]
  caching            = each.value["caching"]
  depends_on = [
    azurerm_windows_virtual_machine.vm
  ]
}

