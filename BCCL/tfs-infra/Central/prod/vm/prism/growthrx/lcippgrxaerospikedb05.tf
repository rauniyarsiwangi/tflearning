
# module "lcippgrxaerospikedb05" {
#   source                = "../../../../../../tfs-modules/azurerm_virtual_machine"
#   create_resource_group = false
#   location              = "central india"
#   os_type = "linux"
#   resource_group_name   = "rsg-ci-central-prd-grx-db-01"
#   enable_ssh_key        = true
#   ssh_key = "ssh-ci-central-prd-shs-001"
#   ssh_key_rg = "rsg-ci-central-prd-shs-01"
#   kv_name = null
#   kv_rg_name = null
#   kv_secret_name = null
#   subnet_name           = "snt-ci-central-prd-db-01"
#   vnet_name             = "vnet-ci-central-prd-net-01"
#   vnet_rg_name          = "rsg-ci-central-prd-net-01"
#   create_public_ip      = false
#   public_ip_name        = ""
#   nic_name              = "lcippgrxaerospikedb05"
#   pip_add_allocation    = "Static"
#   private_ip_address    = "10.11.9.22"
#   os_disk_name          = "lcippgrxaerospikedb05"
#   caching_type          = "ReadWrite"
#   disk_type             = "StandardSSD_LRS"
#   os_disk_size_gb       = "64"
#   os_publisher          = "canonical"
#   os_offer              = "0001-com-ubuntu-server-jammy"
#   os_sku                = "22_04-lts-gen2"
#   image_version         = "latest"
#   create_data_disk      = true
#   data_disk_config = {
#     dd1 = {
#    name = "lcippgrxaerospikedb05_datadisk-01"
#    storage_account_type = "StandardSSD_LRS"
#    disk_size_gb = "64"
#    vmkey = "vm1"
#    lun = "0"
#    caching = "ReadWrite"
#    zone = "2"
# },

#   }
#   vm_config = {
#     "vm1" = {
#       name           = "lcippgrxaerospikedb05"
#       size           = "Standard_D16as_v5"
#       admin_username = "azureadmin"
#       admin_password = null
#       computer_name = "lcippgrxaerospikedb05"
#       disable_password_authentication = true
#       source_image_id = null
#       zone = "2"
#     }
#   }
#   tags = {
#     environment = "Dev"
#   }


# }


    