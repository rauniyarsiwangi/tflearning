locals {
  resource_group_name = element(coalescelist(data.azurerm_resource_group.vm.*.name, azurerm_resource_group.vm.*.name, [""]), 0)
  location            = element(coalescelist(data.azurerm_resource_group.vm.*.location, azurerm_resource_group.vm.*.location, [""]), 0)
  # availability_set_id = element(coalescelist(data.azurerm_availability_set.availability_set.*.id, azurerm_availability_set.availability_set.*.id, [""]), 0)
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

data "azurerm_managed_disk" "os_disk" {
  name                = var.managed_disk_name
  resource_group_name = var.managed_disk_rg
}

# data "azurerm_availability_set" "availability_set" {
#   count               = var.enable_availability_set == false && attach_availability_set == true ? 1 : 0
#   name                = var.availability_set_name
#   resource_group_name = local.resource_group_name
# }

resource "azurerm_availability_set" "availability_set" {
  count                        = var.enable_availability_set == true ? 1 : 0
  name                         = var.availability_set_name
  location                     = local.location
  resource_group_name          = local.resource_group_name
  platform_fault_domain_count  = var.fault_domain_count
  platform_update_domain_count = var.update_domain_count
  managed                      = var.managed
  tags                         = var.tags
}
# resource "azurerm_managed_disk" "os_disk" {
#   # provider             = azurerm.dest
#   name                 = var.os_disk_name
#   location             = local.location
#   resource_group_name  = local.resource_group_name
#   storage_account_type = var.stg_acc_type
#   create_option        = var.create_option
#   source_resource_id   = data.azurerm_snapshot.snapshot.id

#   lifecycle {
#     ignore_changes = [
#       hyper_v_generation, os_type
#     ]
#   }
# }

#ssh keys

# data "azurerm_ssh_public_key" "vm" {
#   name                = var.ssh_key
#   resource_group_name = var.ssh_key_rg
# }

# Data Disk Attachment Exesting Data disk detail

data "azurerm_managed_disk" "data_disk" {
  # provider            = azurerm.source
  for_each            = var.existing_data_disk == true ? var.dd_config : {}
  name                = each.value["name"]
  resource_group_name = each.value["resource_group_name"]
}

# resource "azurerm_managed_disk" "data_disk" {
#   # provider             = azurerm.dest
#   for_each             = var.existing_data_disk == true ? var.dd_config : {}
#   name                 = each.value["dd_name"]
#   location             = local.location
#   resource_group_name  = local.resource_group_name
#   storage_account_type = each.value["stg_acc_type"]
#   create_option        = each.value["create_option"]
#   source_resource_id   = data.azurerm_snapshot.data_disk[each.key].id
# }

resource "azurerm_virtual_machine_data_disk_attachment" "disk_attach" {
  for_each           = var.dd_config
  managed_disk_id    = data.azurerm_managed_disk.data_disk[each.key].id
  virtual_machine_id = azurerm_virtual_machine.vm[each.value.vmkey].id
  lun                = each.value["lun"]
  caching            = each.value["caching"]
}


data "azurerm_subnet" "subnet" {
  # provider             = azurerm.dest
  name                 = var.Subnet_name
  resource_group_name  = var.vnet_rg_name
  virtual_network_name = var.vnet_name
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

# resource "azurerm_network_interface" "nic" {
#   for_each            = var.create_public_ip ? toset(["network_interface"]) : toset(["network_interface"])
#   name                = var.nic_name
#   resource_group_name = local.resource_group_name
#   location            = local.location
#   dns_servers         = var.vm_config.value["os_type"] == "Windows" ? var.dns_ip : null

#   ip_configuration {
#     name                          = data.azurerm_subnet.subnet.name
#     subnet_id                     = data.azurerm_subnet.subnet.id
#     private_ip_address_allocation = var.pip_add_allocation
#     private_ip_address            = var.private_ip_address
#     public_ip_address_id          = var.create_public_ip == true ? azurerm_public_ip.pip[each.key].id : null
#   }
# }


# resource "azurerm_storage_account" "stg" {
#   count                    = var.diag_enabled ? 1 : 0
#   name                     = "crombootdiag1234"
#   resource_group_name      = local.resource_group_name
#   location                 = local.location
#   account_tier             = "Standard"
#   account_replication_type = "LRS"
# }


resource "azurerm_network_interface" "nic" {
  for_each            = var.vm_config
  name                = var.nic_name
  resource_group_name = local.resource_group_name
  location            = local.location
  dns_servers         = each.value["os_type"] == "Windows" ? var.dns_ip : null

  ip_configuration {
    name                          = data.azurerm_subnet.subnet.name
    subnet_id                     = data.azurerm_subnet.subnet.id
    private_ip_address_allocation = var.pip_add_allocation
    private_ip_address            = var.private_ip_address
    public_ip_address_id          = var.create_public_ip == true ? azurerm_public_ip.pip[each.key].id : null
  }
  lifecycle {
    ignore_changes = [ip_configuration,internal_domain_name_suffix]
  }
  tags = var.tags
}

resource "azurerm_virtual_machine" "vm" {
  for_each            = var.vm_config
  name                = each.value["name"]
  location            = local.location
  resource_group_name = local.resource_group_name
  vm_size             = each.value["vm_size"]
  network_interface_ids = [
    azurerm_network_interface.nic[each.key].id,
  ]
  availability_set_id = var.enable_availability_set == true ? azurerm_availability_set.availability_set.0.id : var.av_set_id

  boot_diagnostics {
    enabled     = var.diag_enabled
    storage_uri = var.diag_enabled == "true" ? var.storage_uri : ""
  }

  storage_os_disk {
    name              = data.azurerm_managed_disk.os_disk.name
    managed_disk_id   = data.azurerm_managed_disk.os_disk.id
    managed_disk_type = each.value["stg_acc_type"]
    os_type           = each.value["os_type"]
    create_option     = each.value["create_option"]
  }

  lifecycle {
    ignore_changes = [
      storage_os_disk, network_interface_ids, boot_diagnostics
    ]
  }
  tags = var.tags
}
