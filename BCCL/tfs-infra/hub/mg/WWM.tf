module "WWM" {
  source                     = "../../../tfs-modules/azurerm_management_group"
  display_name               = "WWM"
  parent_management_group_id = null
  subscription_ids           = ["568117db-e994-42ea-b5cb-c62971ca69c1","9b567822-9288-4cf3-b223-5268c3f4fa12", "cd131774-bbbd-4481-bad0-cb48dc289115"]
  enable_rbac                = false
  existing_user              = false
  create_mi                  = false
}
