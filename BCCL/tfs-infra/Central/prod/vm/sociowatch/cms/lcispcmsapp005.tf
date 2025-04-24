
module "lcispcmsapp005" {
  source                = "../../../../../../tfs-modules/azurerm_virtual_machine"
  create_resource_group = false
  location              = "Central india"
  os_type               = "linux"
  resource_group_name   = "rsg-ci-central-prd-sw-cms-001"
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
  nic_name              = "lcispcmsapp005"
  pip_add_allocation    = "Static"
  private_ip_address    = "10.11.0.9"
  os_disk_name          = "lcispcmsapp005"
  caching_type          = "ReadWrite"
  disk_type             = "StandardSSD_LRS"
  os_disk_size_gb       = "64"
  os_publisher          = null
  os_offer              = null
  os_sku                = null
  plan_os_publisher     = "solvedevops1643693563360"
  plan_os_offer         = "fedora-linux-38"
  plan_os_sku           = "plan001"
  image_version         = null
  create_data_disk      = false
  data_disk_config      = {}
  vm_config = {
    "vm1" = {
      name                            = "lcispcmsapp005"
      size                            = "Standard_D2as_v5"
      admin_username                  = "azureadmin"
      admin_password                  = null
      computer_name                   = "lcispcmsapp005"
      disable_password_authentication = true
      source_image_id                 = "/subscriptions/1d68bd1c-9b74-4746-9ebf-9501e41dcd1f/resourceGroups/rsg-ci-hub-prd-shs-01/providers/Microsoft.Compute/galleries/sig_ci_hub_prd_shs_01/images/img-def-sw-lib64-fedora/versions/1.0.0"
      zone                            = "1"
    }
  }
  tags = {
    environment = "prd"
  }


}



