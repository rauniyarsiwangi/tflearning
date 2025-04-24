
module "lciwwmqamaraidb01" {
  source                = "../../../../tfs-modules/azurerm_virtual_machine"
  create_resource_group = false
  location              = "Central india"
  os_type               = "linux"
  resource_group_name   = "rsg-ci-wwm-qa-db-01"
  enable_ssh_key        = true
  ssh_key               = "ssh-ci-wwm-qa-shs-01"
  ssh_key_rg            = "rsg-ci-wwm-qa-shs-01"
  kv_name               = null
  kv_rg_name            = null
  kv_secret_name        = null
  subnet_name           = "snt-ci-wwm-qa-db-01"
  vnet_name             = "vnet-ci-wwm-qa-net-01"
  vnet_rg_name          = "rsg-ci-wwm-qa-net-01"
  create_public_ip      = false
  public_ip_name        = ""
  nic_name              = "lciwwmqamaraidb01"
  pip_add_allocation    = "Static"
  private_ip_address    = "10.15.3.37"
  os_disk_name          = "lciwwmqamaraidb01"
  caching_type          = "ReadWrite"
  disk_type             = "StandardSSD_LRS"
  os_disk_size_gb       = "256"
  os_publisher          = "canonical"
  os_offer              = "0001-com-ubuntu-server-focal"
  os_sku                = "20_04-lts-gen2"
  image_version         = "latest"
  create_data_disk      = true
  data_disk_config = {
    "dd1" = {
      name                 = "lciwwmqamaraidb01_datadisk-01"
      storage_account_type = "StandardSSD_LRS"
      disk_size_gb         = "256"
      vmkey                = "vm1"
      lun                  = "0"
      caching              = "ReadWrite"
    }
  }
  vm_config = {
    "vm1" = {
      name                            = "lciwwmqamaraidb01"
      size                            = "Standard_D4ls_v5"
      admin_username                  = "azureadmin"
      admin_password                  = null
      computer_name                   = "lciwwmqamaraidb01"
      disable_password_authentication = true
      source_image_id                 = null
    }
  }
  tags = {
    environment = "qa"
  }


}



