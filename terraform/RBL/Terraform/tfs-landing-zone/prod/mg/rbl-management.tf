module "rbl-management" {
  source                     = "../../../tfs-modules/azurerm_management_group"
  display_name               = "rbl-management"
  parent_management_group_id = module.rbl-platform.mg
  subscription_ids           = []
  depends_on                 = [module.rbl-platform]
  enable_rbac                = true
  create_mi                  = false
  user_principal_name        = "admin@anshurohit5845.tk"
  mg_role = {
    "role1" = {
      role_definition_name = "Owner"
      principal_id         = "7be85db8-650c-4ee2-a942-a0b22f194dc4"
    }
  }
}
