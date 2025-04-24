# locals {
#   resource_group_name = element(coalescelist(data.azurerm_resource_group.vm.*.name, azurerm_resource_group.vm.*.name, [""]), 0)
#   location            = element(coalescelist(data.azurerm_resource_group.vm.*.location, azurerm_resource_group.vm.*.location, [""]), 0)
#   #  availability_set_id = element(coalescelist(data.azurerm_availability_set.as.*.id, azurerm_availability_set.as.*.id, [""]), 0)
# }

# data "azurerm_resource_group" "vm" {
#   count = var.create_resource_group == false ? 1 : 0
#   name  = var.resource_group_name
# }

# resource "azurerm_resource_group" "vm" {
#   count    = var.create_resource_group == true ? 1 : 0
#   location = var.location
#   name     = var.resource_group_name
# }

# data "azurerm_snapshot" "os_disk" {
#   provider            = azurerm.source
#   name                = var.existing_snapshot_name
#   resource_group_name = var.existing_snapshot_name_resource_group_name
# }


# resource "azurerm_managed_disk" "os_disk" {
#   provider             = azurerm.dest
#   name                 = var.os_disk_name
#   location             = local.location
#   resource_group_name  = local.resource_group_name
#   storage_account_type = var.stg_acc_type
#   create_option        = "Copy"
#   source_resource_id   = data.azurerm_snapshot.os_disk.id
#   disk_size_gb         = var.os_disk_size
# }

# data "azurerm_snapshot" "data_disk" {
#   provider            = azurerm.source
#   for_each            = var.existing_snapshot == true ? var.dd_config : {}
#   name                = each.value["name"]
#   resource_group_name = each.value["resource_group_name"]
# }

# resource "azurerm_managed_disk" "data_disk" {
#   provider             = azurerm.dest
#   for_each             = var.existing_snapshot == true ? var.dd_config : {}
#   name                 = each.value["dd_name"]
#   location             = local.location
#   resource_group_name  = local.resource_group_name
#   storage_account_type = each.value["storage_account_type"]
#   create_option        = "Copy"
#   source_resource_id   = data.azurerm_snapshot.data_disk[each.key].id
#   disk_size_gb         = each.value["disk_size_gb"]
# }

# resource "azurerm_virtual_machine_data_disk_attachment" "disk_attach" {
#   for_each           = var.dd_config
#   managed_disk_id    = azurerm_managed_disk.data_disk[each.key].id
#   virtual_machine_id = azurerm_virtual_machine.vm[each.value.vmkey].id
#   lun                = each.value["lun"]
#   caching            = each.value["caching"]
# }


# data "azurerm_subnet" "subnet" {
#   provider             = azurerm.dest
#   name                 = var.Subnet_name
#   resource_group_name  = var.vnet_rg_name
#   virtual_network_name = var.vnet_name
# }

# resource "azurerm_public_ip" "pip" {
#   for_each            = var.create_public_ip ? toset(["public_ip"]) : toset([])
#   name                = var.public_ip_name
#   location            = local.location
#   resource_group_name = local.resource_group_name
#   allocation_method   = "Static"
#   sku                 = "Standard"
# }

# resource "azurerm_network_interface" "nic" {
#   for_each            = var.create_public_ip ? toset(["network_interface"]) : toset(["network_interface"])
#   name                = var.nic_name
#   resource_group_name = local.resource_group_name
#   location            = local.location

#   ip_configuration {
#     name                          = data.azurerm_subnet.subnet.name
#     subnet_id                     = data.azurerm_subnet.subnet.id
#     private_ip_address_allocation = var.pip_add_allocation
#     private_ip_address            = var.private_ip_address
#     public_ip_address_id          = var.create_public_ip == true ? azurerm_public_ip.pip[each.key].id : null
#   }
# }

# resource "azurerm_virtual_machine" "vm" {
#   for_each            = var.vm_config
#   name                = each.value["name"]
#   location            = local.location
#   resource_group_name = local.resource_group_name
#   vm_size             = each.value["vm_size"]
#   network_interface_ids = [
#     azurerm_network_interface.nic["network_interface"].id,
#   ]

#   storage_os_disk {
#     name              = azurerm_managed_disk.os_disk.name
#     managed_disk_id   = azurerm_managed_disk.os_disk.id
#     managed_disk_type = each.value["stg_acc_type"]
#     os_type           = each.value["os_type"]
#     create_option     = each.value["create_option"]
#   }

#   os_profile {
#     computer_name  = each.value["computer_name"]
#     admin_username = each.value["admin_username"]
#     admin_password = each.value["admin_password"]
#   }
#   os_profile_linux_config {
#     disable_password_authentication = var.disable_password_authentication
#     dynamic "ssh_keys" {
#       for_each = var.disable_password_authentication == false ? [] : [1]
#       content {
#         key_data = data.azurerm_ssh_public_key.vm.public_key
#         path     = "/home/${each.value["admin_username"]}/.ssh/authorized_keys"
#       }
#     }
#   }

#   lifecycle {
#     ignore_changes = [
#       storage_os_disk
#     ]
#   }
# }
