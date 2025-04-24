
module "lciwwmprdweb02" {
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
  nic_name              = "lciwwmprdweb02"
  pip_add_allocation    = "Static"
  private_ip_address    = "10.15.0.15"
  os_disk_name          = "lciwwmprdweb02"
  caching_type          = "ReadWrite"
  disk_type             = "StandardSSD_LRS"
  os_disk_size_gb       = "64"
  os_publisher          = "canonical"
  os_offer              = "0001-com-ubuntu-server-jammy"
  os_sku                = "22_04-lts-gen2"
  image_version         = "latest"
  create_data_disk      = false
  data_disk_config      = {}
  vm_config = {
    "vm1" = {
      name                            = "lciwwmprdweb02"
      size                            = "Standard_D4s_v5"
      admin_username                  = "azureadmin"
      admin_password                  = null
      computer_name                   = "lciwwmprdweb02"
      disable_password_authentication = true
      source_image_id                 = null
      zone                            = "2"
    }
  }
  tags = {
    environment = "prd"
  }


}



