module "pim" {
  source         = "../../../tfs-modules/azurerm_pim_eligible_role_assignment"
  role_name      = "Reader"
  principal_id   = "e3e040f2-2d80-4600-8b33-e353ea58bc91"
  duration_hours = 8
  justification =  "na"
}
