module "HUB" {
  source                     = "../../../tfs-modules/azurerm_management_group"
  display_name               = "HUB"
  parent_management_group_id = null
  subscription_ids           = ["1d68bd1c-9b74-4746-9ebf-9501e41dcd1f"]
  enable_rbac                = false
  existing_user              = false
  create_mi                  = false
}
