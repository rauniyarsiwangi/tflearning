
module "lcippssoapp006" {
  source                = "../../../tfs-modules/azurerm_virtual_machine"
  create_resource_group = false
  location              = "central india"
  os_type               = "linux"
  resource_group_name   = "rsg-ci-hub-prd-sso-01"
  enable_ssh_key        = true
  kv_name               = null
  kv_rg_name            = null
  kv_secret_name        = null
  ssh_key               = "ssh-ci-hub-prd-shs-001"
  ssh_key_rg            = "rsg-ci-hub-prd-shs-01"
  vnet_name             = "vnet-ci-hub-prd-net-01"
  vnet_rg_name          = "rsg-ci-hub-prd-net-01"
  subnet_name           = "snt-ci-hub-prd-identity-01"
  create_public_ip      = false
  public_ip_name        = ""
  nic_name              = "lcippssoapp006"
  pip_add_allocation    = "Static"
  private_ip_address    = "10.10.2.20"
  os_disk_name          = "lcippssoapp006"
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
      name                            = "lcippssoapp006"
      size                            = "Standard_D4ls_v5"
      admin_username                  = "azureadmin"
      admin_password                  = null
      computer_name                   = "lcippssoapp006"
      disable_password_authentication = true
      source_image_id                 = "/subscriptions/1d68bd1c-9b74-4746-9ebf-9501e41dcd1f/resourceGroups/rsg-ci-hub-prd-shs-01/providers/Microsoft.Compute/galleries/sig_ci_hub_prd_shs_01/images/img-def-p-prd-java8-cos-apache2.4-TC8.5.54/versions/1.0.1"
      zone                            = "1"
    }
  }
  tags = {
    environment = "Poc"
  }


}


    
