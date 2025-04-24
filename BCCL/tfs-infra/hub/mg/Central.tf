module "Central" {
  source                     = "../../../tfs-modules/azurerm_management_group"
  display_name               = "Central"
  parent_management_group_id = null
  subscription_ids           = ["82d6427a-b3de-416a-b13a-dd49007d7957","f4cd9586-d49d-4f16-874e-3441698105f7"]
  enable_rbac                = false
  existing_user              = false
  create_mi                  = false
}
