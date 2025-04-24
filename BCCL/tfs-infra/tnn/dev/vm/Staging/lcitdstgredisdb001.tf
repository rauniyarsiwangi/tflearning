
module "lcitdstgredisdb001" {
  source                = "../../../../../tfs-modules/azurerm_virtual_machine"
  create_resource_group = false
  location              = "central india"
  os_type               = "linux"
  resource_group_name   = "rsg-ci-tnn-dev-STG-db-01"
  enable_ssh_key        = true
  ssh_key               = "ssh-ci-tnn-dev-shs-001"
  ssh_key_rg            = "rsg-ci-tnn-dev-shs-01"
  kv_name               = null
  kv_rg_name            = null
  kv_secret_name        = null
  subnet_name           = "snt-ci-tnn-dev-db-01"
  vnet_name             = "vnet-ci-tnn-dev-net-01"
  vnet_rg_name          = "rsg-ci-tnn-dev-net-01"
  create_public_ip      = false
  public_ip_name        = ""
  nic_name              = "lcitdstgredisdb001"
  pip_add_allocation    = "Static"
  private_ip_address    = "10.14.8.8"
  os_disk_name          = "lcitdstgredisdb001"
  caching_type          = "ReadWrite"
  disk_type             = "StandardSSD_LRS"
  os_disk_size_gb       = "32"
  os_publisher          = "canonical"
  os_offer              = "0001-com-ubuntu-server-focal"
  os_sku                = "20_04-lts-gen2"
  image_version         = "latest"
  create_data_disk      = false
  data_disk_config = {

  }
  vm_config = {
    "vm1" = {
      name                            = "lcitdstgredisdb001"
      size                            = "Standard_D2as_v5"
      admin_username                  = "azureadmin"
      admin_password                  = null
      computer_name                   = "lcitdstgredisdb001"
      disable_password_authentication = true
      source_image_id                 = null
      zone                            = null
    }
  }
  tags = {
    environment = "dev"
  }


}



