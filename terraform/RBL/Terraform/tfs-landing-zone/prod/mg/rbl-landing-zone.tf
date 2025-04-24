module "rbl-landing-zone" {
  source                     = "../../../tfs-modules/azurerm_management_group"
  display_name               = "rbl-landing-zone"
  parent_management_group_id = module.rbl-management-group.mg
  subscription_ids           = []
  depends_on                 = [module.rbl-management-group]
  enable_rbac                = true
  existing_user              = false
  mg_role = {
    "role1" = {
      role_definition_name = "Owner"
    }
  }
  create_mi = true
  location  = "Central india"
  mi_name   = "rbl-landing-zone-mg-mi"
  rg_name   = "test-rg"
}
