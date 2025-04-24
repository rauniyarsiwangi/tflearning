module "policy014" {
  source           = "../../../tfs-modules/azurerm_policy_assignment"
  assignment_scope = "mg"
  mg_name          = "rbl-connectivity"
  policy_def_config = {
    "policy1" = {
      policy_definition_id     = "/providers/Microsoft.Authorization/policyDefinitions/cccc23c7-8427-4f53-ad12-b6a63eb452b3"
      name                     = "Allowed VM SKUs"
      display_name             = "Allowed virtual machine size SKUs"
      description              = "This policy enables you to specify a set of virtual machine size SKUs that your organization can deploy."
      define_resource_selector = false
      enforce                  = true
      location                 = "Central india"
            parameters = jsonencode({
        listOfAllowedSKUs = {
          value = ["Standard_B2ms"]
        }
      })
    }
  }
}
