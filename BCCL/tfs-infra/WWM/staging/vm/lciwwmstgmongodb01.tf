
# module "lciwwmstgmongodb01" {
#   source                = "../../../../tfs-modules/azurerm_virtual_machine"
#   create_resource_group = false
#   location              = "Central india"
#   os_type               = "linux"
#   resource_group_name   = "rsg-ci-wwm-stg-db-01"
#   enable_ssh_key        = true
#   ssh_key               = "ssh-ci-wwm-stg-shs-01"
#   ssh_key_rg            = "rsg-ci-wwm-stg-shs-01"
#   kv_name               = null
#   kv_rg_name            = null
#   kv_secret_name        = null
#   subnet_name           = "snt-ci-wwm-stg-db-01"
#   vnet_name             = "vnet-ci-wwm-stg-net-01"
#   vnet_rg_name          = "rsg-ci-wwm-stg-net-01"
#   create_public_ip      = false
#   public_ip_name        = ""
#   nic_name              = "lciwwmstgmongodb01"
#   pip_add_allocation    = "Static"
#   private_ip_address    = "10.15.2.37"
#   os_disk_name          = "lciwwmstgmongodb01"
#   caching_type          = "ReadWrite"
#   disk_type             = "StandardSSD_LRS"
#   os_disk_size_gb       = "256"
#   os_publisher          = "canonical"
#   os_offer              = "0001-com-ubuntu-server-jammy"
#   os_sku                = "22_04-lts-gen2"
#   image_version         = "latest"
#   create_data_disk      = true
#   data_disk_config = {
#     "dd1" = {
#       name                 = "lciwwmstgmongodb01_datadisk-01"
#       storage_account_type = "StandardSSD_LRS"
#       disk_size_gb         = "128"
#       vmkey                = "vm1"
#       lun                  = "0"
#       caching              = "ReadWrite"
#     }
#   }
#   vm_config = {
#     "vm1" = {
#       name                            = "lciwwmstgmongodb01"
#       size                            = "Standard_D4ls_v5"
#       admin_username                  = "azureadmin"
#       admin_password                  = null
#       computer_name                   = "lciwwmstgmongodb01"
#       disable_password_authentication = true
#       source_image_id                 = null
#     }
#   }
#   tags = {
#     environment = "stg"
#   }


# }



