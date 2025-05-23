
module "lcipptmcapp004" {
  source                = "../../../../../../tfs-modules/azurerm_virtual_machine"
  create_resource_group = false
  location              = "central india"
  os_type               = "linux"
  resource_group_name   = "rsg-ci-central-prd-prism-tmc-01"
  enable_ssh_key        = true
  ssh_key               = "ssh-ci-central-prd-shs-001"
  ssh_key_rg            = "rsg-ci-central-prd-shs-01"
  kv_name               = null
  kv_rg_name            = null
  kv_secret_name        = null
  subnet_name           = "snt-ci-central-prd-app-01"
  vnet_name             = "vnet-ci-central-prd-net-01"
  vnet_rg_name          = "rsg-ci-central-prd-net-01"
  create_public_ip      = false
  public_ip_name        = ""
  nic_name              = "lcipptmcapp004"
  pip_add_allocation    = "Static"
  private_ip_address    = "10.11.0.184"
  os_disk_name          = "lcipptmcapp004"
  caching_type          = "ReadWrite"
  disk_type             = "StandardSSD_LRS"
  os_disk_size_gb       = "32"
  os_publisher          = null
  os_offer              = null
  os_sku                = null
  image_version         = null
  create_data_disk      = false
  data_disk_config = {
    "dd1" = {
      name                 = "lcipptmcapp004-datadisk-01"
      storage_account_type = "StandardSSD_LRS"
      disk_size_gb         = "128"
      lun                  = 0
      caching              = "ReadWrite"
      vmkey                = "vm1"
      zone                 = "1"
    }
  }
  vm_config = {
    "vm1" = {
      name                            = "lcipptmcapp004"
      size                            = "Standard_D8ls_v5"
      admin_username                  = "azureadmin"
      admin_password                  = null
      computer_name                   = "lcipptmcapp004"
      disable_password_authentication = true
      source_image_id                 = "/subscriptions/1d68bd1c-9b74-4746-9ebf-9501e41dcd1f/resourceGroups/rsg-ci-hub-prd-shs-01/providers/Microsoft.Compute/galleries/sig_ci_hub_prd_shs_01/images/img-def-prd-nginx-java-17-tomcat-10-1-20-python-3-0-6-nginx/versions/1.0.0"
      zone                            = "2"
    }
  }
  tags = {
    environment = "prd"
    Module      = "times_content"
    application = "prism"
  }


}



