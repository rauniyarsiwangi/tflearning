
module "lcippcmsmongodb01" {
  source                = "../../../../../../tfs-modules/azurerm_virtual_machine"
  create_resource_group = false
  location              = "central india"
  os_type               = "linux"
  resource_group_name   = "rsg-ci-central-prd-cms-db-01"
  enable_ssh_key        = true
  ssh_key               = "ssh-ci-central-prd-shs-001"
  ssh_key_rg            = "rsg-ci-central-prd-shs-01"
  kv_name               = null
  kv_rg_name            = null
  kv_secret_name        = null
  subnet_name           = "snt-ci-central-prd-db-01"
  vnet_name             = "vnet-ci-central-prd-net-01"
  vnet_rg_name          = "rsg-ci-central-prd-net-01"
  create_public_ip      = false
  public_ip_name        = ""
  nic_name              = "lcippcmsmongodb01"
  pip_add_allocation    = "Static"
  private_ip_address    = "10.11.8.184"
  os_disk_name          = "lcippcmsmongodb01"
  caching_type          = "ReadWrite"
  disk_type             = "StandardSSD_LRS"
  os_disk_size_gb       = "64"
  os_publisher          = "canonical"
  os_offer              = "0001-com-ubuntu-pro-trusty"
  os_sku                = "pro-14_04-lts"
  image_version         = "latest"
  create_data_disk      = true
  plan_os_offer         = "0001-com-ubuntu-pro-trusty"
  plan_os_publisher     = "canonical"
  plan_os_sku           = "pro-14_04-lts"
  data_disk_config = {
    dd1 = {
      name                 = "lcippcmsmongodb01_datadisk-01"
      storage_account_type = "StandardSSD_LRS"
      disk_size_gb         = "128"
      vmkey                = "vm1"
      lun                  = "0"
      caching              = "ReadWrite"
      zone                 = "1"
    },

  }
  vm_config = {
    "vm1" = {
      name                            = "lcippcmsmongodb01"
      size                            = "Standard_D8ls_v5"
      admin_username                  = "azureadmin"
      admin_password                  = null
      computer_name                   = "lcippcmsmongodb01"
      disable_password_authentication = true
      source_image_id                 = null
      zone                            = "1"
    }
  }
  tags = {
    environment = "Dev"
  }


}



