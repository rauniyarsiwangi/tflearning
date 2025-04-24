
module "lcipddsmariadb01" {
  source                = "../../../../../../tfs-modules/azurerm_virtual_machine"
  create_resource_group = false
  location              = "Central india"
  os_type = "linux"
  resource_group_name   = "rsg-ci-central-dev-prism-ds-db-01"
  enable_ssh_key        = true
  ssh_key = "ssh-ci-central-dev-shs-001"
  ssh_key_rg = "rsg-ci-central-dev-shs-01"
  kv_name = null
  kv_rg_name = null
  kv_secret_name = null
  subnet_name           = "snt-ci-central-dev-db-01"
  vnet_name             = "vnet-ci-central-dev-net-01"
  vnet_rg_name          = "rsg-ci-central-dev-net-01"
  create_public_ip      = false
  public_ip_name        = ""
  nic_name              = "lcipddsmariadb01"
  pip_add_allocation    = "Static"
  private_ip_address    = "10.12.8.39"
  os_disk_name          = "lcipddsmariadb01"
  caching_type          = "ReadWrite"
  disk_type             = "StandardSSD_LRS"
  os_disk_size_gb       = "32"
  os_publisher          = "canonical"
  os_offer              = "0001-com-ubuntu-server-jammy"
  os_sku                = "22_04-lts-gen2"
  image_version         = "latest"
  create_data_disk      = false
  data_disk_config = {
    
  }
  vm_config = {
    "vm1" = {
      name           = "lcipddsmariadb01"
      size           = "Standard_D4ls_v5"
      admin_username = "azureadmin"
      admin_password = null
      computer_name = "lcipddsmariadb01"
      disable_password_authentication = true
      source_image_id = null
      zone = "1"
    }
  }
  tags = {
    environment = "Dev"
  }


}


    