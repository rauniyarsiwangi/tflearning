
module "lciwwmprdwebapp01" {
  source                = "../../../../tfs-modules/azurerm_virtual_machine"
  create_resource_group = false
  location              = "Central india"
  os_type               = "linux"
  resource_group_name   = "rsg-ci-wwm-prd-app-01"
  enable_ssh_key        = true
  ssh_key               = "ssh-ci-wwm-prd-shs-01"
  ssh_key_rg            = "rsg-ci-wwm-prd-shs-01"
  kv_name               = null
  kv_rg_name            = null
  kv_secret_name        = null
  subnet_name           = "snt-ci-wwm-prd-app-01"
  vnet_name             = "vnet-ci-wwm-prd-net-01"
  vnet_rg_name          = "rsg-ci-wwm-prd-net-01"
  create_public_ip      = false
  public_ip_name        = ""
  nic_name              = "lciwwmprdwebapp01"
  pip_add_allocation    = "Static"
  private_ip_address    = "10.15.0.12"
  os_disk_name          = "lciwwmprdwebapp01"
  caching_type          = "ReadWrite"
  disk_type             = "StandardSSD_LRS"
  os_disk_size_gb       = "64"
  os_publisher          = null
  os_offer              = null
  os_sku                = null
  image_version         = null
  create_data_disk      = false
  data_disk_config = {
    "dd1" = {
      name                 = "lciwwmprdwebapp01_datadisk-01"
      storage_account_type = "StandardSSD_LRS"
      disk_size_gb         = "1024"
      vmkey                = "vm1"
      lun                  = "0"
      caching              = "ReadWrite"
      zone                 = "1"
    }

  }
  vm_config = {
    "vm1" = {
      name                            = "lciwwmprdwebapp01"
      size                            = "Standard_F2s_v2"
      admin_username                  = "azureadmin"
      admin_password                  = null
      computer_name                   = "lciwwmprdwebapp01"
      disable_password_authentication = true
      source_image_id                 = "/subscriptions/1d68bd1c-9b74-4746-9ebf-9501e41dcd1f/resourceGroups/rsg-ci-hub-prd-shs-01/providers/Microsoft.Compute/galleries/sig_ci_hub_prd_shs_01/images/img-def-tnn/versions/1.0.0"
      zone                            = "1"
    }
  }
  tags = {
    environment = "prd"
  }


}



