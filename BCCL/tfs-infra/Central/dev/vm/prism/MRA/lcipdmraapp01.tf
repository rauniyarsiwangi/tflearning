
module "lcipdmraapp01" {
  source                = "../../../../../../tfs-modules/azurerm_virtual_machine"
  create_resource_group = false
  location              = "Central india"
  os_type               = "linux"
  resource_group_name   = "rsg-ci-central-dev-prism-mra-01"
  enable_ssh_key        = true
  ssh_key               = "ssh-ci-central-dev-shs-002"
  ssh_key_rg            = "rsg-ci-central-dev-shs-01"
  kv_name               = null
  kv_rg_name            = null
  kv_secret_name        = null
  subnet_name           = "snt-ci-central-dev-app-01"
  vnet_name             = "vnet-ci-central-dev-net-01"
  vnet_rg_name          = "rsg-ci-central-dev-net-01"
  create_public_ip      = false
  public_ip_name        = ""
  nic_name              = "lcipdmraapp01"
  pip_add_allocation    = "Static"
  private_ip_address    = "10.12.0.194"
  os_disk_name          = "lcipdmraapp01"
  caching_type          = "ReadWrite"
  disk_type             = "StandardSSD_LRS"
  os_disk_size_gb       = "128"
  os_publisher          = null
  os_offer              = null
  os_sku                = null
  image_version         = null
  create_data_disk      = false
  data_disk_config = {

  }
  vm_config = {
    "vm1" = {
      name                            = "lcipdmraapp01"
      size                            = "Standard_D2as_v5"
      admin_username                  = "azureadmin"
      admin_password                  = null
      computer_name                   = "lcipdmraapp01"
      disable_password_authentication = true
      source_image_id                 = "/subscriptions/1d68bd1c-9b74-4746-9ebf-9501e41dcd1f/resourceGroups/rsg-ci-hub-prd-shs-01/providers/Microsoft.Compute/galleries/sig_ci_hub_prd_shs_01/images/img-def-p-prd-java8-TC9.0-apache2.4/versions/1.0.1"
      zone                            = "1"
    }
  }
  tags = {
    environment = "Poc"
  }


}


    
