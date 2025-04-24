
# module "lcitdtnnwebapp003" {
#   source                = "../../../../../tfs-modules/azurerm_virtual_machine"
#   create_resource_group = false
#   location              = "central india"
#   os_type               = "linux"
#   resource_group_name   = "rsg-ci-tnn-dev-tnn-web-app-01"
#   enable_ssh_key        = true
#   ssh_key               = "ssh-ci-tnn-dev-shs-001"
#   ssh_key_rg            = "rsg-ci-tnn-dev-shs-01"
#   kv_name               = null
#   kv_rg_name            = null
#   kv_secret_name        = null
#   subnet_name           = "snt-ci-tnn-dev-app-01"
#   vnet_name             = "vnet-ci-tnn-dev-net-01"
#   vnet_rg_name          = "rsg-ci-tnn-dev-net-01"
#   create_public_ip      = false
#   public_ip_name        = ""
#   nic_name              = "lcitdtnnwebapp003"
#   pip_add_allocation    = "Static"
#   private_ip_address    = "10.14.0.7"
#   os_disk_name          = "lcitdtnnwebapp003"
#   caching_type          = "ReadWrite"
#   disk_type             = "StandardSSD_LRS"
#   os_disk_size_gb       = "64"
#   os_publisher          = null
#   os_offer              = null
#   os_sku                = null
#   image_version         = null
#   create_data_disk      = false
#   data_disk_config = {

#   }
#   vm_config = {
#     "vm1" = {
#       name                            = "lcitdtnnwebapp003"
#       size                            = "Standard_D2as_v5"
#       admin_username                  = "azureadmin"
#       admin_password                  = null
#       computer_name                   = "lcitdtnnwebapp003"
#       disable_password_authentication = true
#       source_image_id                 = "/subscriptions/1d68bd1c-9b74-4746-9ebf-9501e41dcd1f/resourceGroups/rsg-ci-hub-prd-shs-01/providers/Microsoft.Compute/galleries/sig_ci_hub_prd_shs_01/images/img-def-tnn-nginx-pm2-yarn-react/versions/1.0.0"
#       zone                            = null
#     }
#   }
#   tags = {
#     environment = "dev"
#   }


# }



