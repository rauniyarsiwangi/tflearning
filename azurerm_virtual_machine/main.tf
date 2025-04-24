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
}

data "azurerm_ssh_public_key" "vm" {
  count               = var.enable_ssh_key == true ? 1 : 0
  name                = var.ssh_key
  resource_group_name = var.ssh_key_rg
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
  for_each           = var.create_data_disk == true && var.os_type == "linux" ? var.data_disk_config : {}
  managed_disk_id    = azurerm_managed_disk.data_disk[each.key].id
  virtual_machine_id = azurerm_linux_virtual_machine.vm[each.value.vmkey].id
  lun                = each.value["lun"]
  caching            = each.value["caching"]
  depends_on = [
    azurerm_linux_virtual_machine.vm
  ]
}

resource "azurerm_virtual_machine_data_disk_attachment" "atc" {
  for_each           = var.create_data_disk == true && var.os_type == "windows" ? var.data_disk_config : {}
  managed_disk_id    = azurerm_managed_disk.data_disk[each.key].id
  virtual_machine_id = azurerm_windows_virtual_machine.win_vm[each.value.vmkey].id
  lun                = each.value["lun"]
  caching            = each.value["caching"]
  depends_on = [
    azurerm_windows_virtual_machine.win_vm
  ]
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
  tags                = var.tags
}

resource "azurerm_network_interface" "nic" {
  for_each            = var.vm_config
  name                = var.nic_name
  resource_group_name = local.resource_group_name
  location            = local.location
  dns_servers         = var.os_type == "Windows" ? var.dns_ip : null

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

data "azurerm_storage_account" "storeacc" {
  count               = var.enable_boot_diagnostics == true ? 1 : 0
  name                = var.storage_account_name
  resource_group_name = local.resource_group_name
}

data "azurerm_key_vault" "akv" {
  count               = var.enable_ssh_key == false ? 1 : 0
  name                = var.kv_name
  resource_group_name = var.kv_rg_name
}

resource "random_password" "vm" {
  count   = var.enable_ssh_key == false ? 1 : 0
  length  = 32
  special = false
}
#Create Key Vault Secret
resource "azurerm_key_vault_secret" "vm" {
  count        = var.enable_ssh_key == false ? 1 : 0
  name         = var.kv_secret_name
  value        = random_password.vm[count.index].result
  key_vault_id = data.azurerm_key_vault.akv[count.index].id
}


resource "azurerm_linux_virtual_machine" "vm" {
  for_each                        = var.os_type == "linux" ? var.vm_config : {}
  name                            = each.value["name"]
  resource_group_name             = local.resource_group_name
  location                        = local.location
  size                            = each.value["size"]
  admin_username                  = var.enable_ssh_key == true ? each.value["admin_username"] : azurerm_key_vault_secret.vm.0.name
  admin_password                  = var.enable_ssh_key == true && each.value["admin_password"] == null ? null : each.value["admin_password"] == null ? azurerm_key_vault_secret.vm.0.value : each.value["admin_password"]
  disable_password_authentication = var.enable_ssh_key == true ? true : false
  provision_vm_agent              = each.value["provision_vm_agent"]
  computer_name                   = each.value["computer_name"]
  allow_extension_operations      = true
  license_type                    = each.value["license_type"]
  availability_set_id             = each.value["availability_set_id"]
  zone                            = each.value["zone"]
  network_interface_ids = [
    azurerm_network_interface.nic[each.key].id,
  ]

  dynamic "admin_ssh_key" {
    for_each = var.enable_ssh_key ? [1] : []
    content {
      username   = each.value["admin_username"]
      public_key = data.azurerm_ssh_public_key.vm.0.public_key
    }
  }


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

  dynamic "boot_diagnostics" {
    for_each = var.enable_boot_diagnostics ? [1] : []
    content {
      storage_account_uri = var.storage_account_name != null ? data.azurerm_storage_account.storeacc.0.primary_blob_endpoint : null
    }
  }

  dynamic "identity" {
    for_each = var.managed_identity_type != null ? [1] : []
    content {
      type         = var.managed_identity_type
      identity_ids = var.managed_identity_type == "UserAssigned" || var.managed_identity_type == "SystemAssigned, UserAssigned" ? var.managed_identity_ids : null
    }
  }

  tags = var.tags

  lifecycle {
    ignore_changes = [
      boot_diagnostics, identity
    ]
  }
  depends_on = [azurerm_key_vault_secret.vm]
}




resource "azurerm_windows_virtual_machine" "win_vm" {
  for_each                 = var.os_type == "windows" ? var.vm_config : {}
  name                     = each.value["name"]
  resource_group_name      = local.resource_group_name
  location                 = local.location
  size                     = each.value["size"]
  computer_name            = each.value["computer_name"]
  admin_username           = each.value["admin_username"] == null ? azurerm_key_vault_secret.vm.0.name : each.value["admin_username"]
  admin_password           = each.value["admin_password"] == null ? azurerm_key_vault_secret.vm.0.value : each.value["admin_password"]
  provision_vm_agent       = each.value["provision_vm_agent"]
  enable_automatic_updates = each.value["enable_automatic_updates"]
  network_interface_ids = [
    azurerm_network_interface.nic[each.key].id,
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

  dynamic "boot_diagnostics" {
    for_each = var.enable_boot_diagnostics ? [1] : []
    content {
      storage_account_uri = var.storage_account_name != null ? data.azurerm_storage_account.storeacc.0.primary_blob_endpoint : null
    }
  }

  dynamic "identity" {
    for_each = var.managed_identity_type != null ? [1] : []
    content {
      type         = var.managed_identity_type
      identity_ids = var.managed_identity_type == "UserAssigned" || var.managed_identity_type == "SystemAssigned, UserAssigned" ? var.managed_identity_ids : null
    }
  }
  tags = var.tags

  lifecycle {
    ignore_changes = [
      boot_diagnostics, identity
    ]
  }
  depends_on = [azurerm_key_vault_secret.vm]
}







