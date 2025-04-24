module "TNN" {
  source                     = "../../../tfs-modules/azurerm_management_group"
  display_name               = "TNN"
  parent_management_group_id = null
  subscription_ids           = ["ffc0d792-596a-4c00-8f6e-65629b36397c","01613652-02cb-462e-92b3-6f5e84fd4f0b"]
  enable_rbac                = false
  existing_user              = false
  create_mi                  = false
}
