module "rbi-policy" {
  source           = "../../../tfs-modules/azurerm_policy_assignment"
  assignment_scope = "mg"
  mg_name          = "rbl-production"
  policy_def_config = {
    "policy1" = {
      policy_definition_id     = "/providers/Microsoft.Authorization/policySetDefinitions/d0d5578d-cc08-2b22-31e3-f525374f235a"
      name                     = "IT Framework for Bank"
      display_name             = "Reserve Bank of India - IT Framework for Banks"
      description              = "This initiative includes policies that address a subset of Reserve Bank of India IT Framework for Banks controls. Additional policies will be added in upcoming releases."
      define_resource_selector = false
      enforce                  = true
      location                 = "Central india"
    }
  }
}
