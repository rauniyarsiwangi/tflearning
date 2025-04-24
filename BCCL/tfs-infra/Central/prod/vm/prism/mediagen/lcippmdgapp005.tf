
# module "lcippmdgapp005" {
#   source                = "../../../../../../tfs-modules/azurerm_virtual_machine"
#   create_resource_group = false
#   location              = "central india"
#   os_type = "linux"
#   resource_group_name   = "rsg-ci-central-prd-prism-mdg-01"
#   enable_ssh_key        = true
#   ssh_key = "ssh-ci-central-prd-shs-001"
#   ssh_key_rg = "rsg-ci-central-prd-shs-01"
#   kv_name = null
#   kv_rg_name = null
#   kv_secret_name = null
#   subnet_name           = "snt-ci-central-prd-app-01"
#   vnet_name             = "vnet-ci-central-prd-net-01"
#   vnet_rg_name          = "rsg-ci-central-prd-net-01"
#   create_public_ip      = false
#   public_ip_name        = ""
#   nic_name              = "lcippmdgapp005"
#   pip_add_allocation    = "Static"
#   private_ip_address    = "10.11.0.41"
#   os_disk_name          = "lcippmdgapp005"
#   caching_type          = "ReadWrite"
#   disk_type             = "StandardSSD_LRS"
#   os_disk_size_gb       = "128"
#   os_publisher          = null
#   os_offer              = null
#   os_sku                = null
#   image_version         = null
#   create_data_disk      = false
#   data_disk_config = {
    
#   }
#   vm_config = {
#     "vm1" = {
#       name           = "lcippmdgapp005"
#       size           = "Standard_D8as_v5"
#       admin_username = "azureadmin"
#       admin_password = null
#       computer_name = "lcippmdgapp005"
#       disable_password_authentication = true
#       source_image_id = "/subscriptions/1d68bd1c-9b74-4746-9ebf-9501e41dcd1f/resourceGroups/rsg-ci-hub-prd-shs-01/providers/Microsoft.Compute/galleries/sig_ci_hub_prd_shs_01/images/img-def-p-prd-java8-TC8.0.39-nginx/versions/1.0.0"
#       zone = "2"
#     }
#   }
#   tags = {
#     environment = "Poc"
#   }


# }


    