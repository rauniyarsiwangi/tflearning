module "policy012" {
  source           = "../../../tfs-modules/azurerm_policy_assignment"
  assignment_scope = "mg"
  mg_name          = "rbl-pre-production"
  policy_def_config = {
    "policy1" = {
      policy_definition_id     = "/providers/Microsoft.Authorization/policyDefinitions/a08ec900-254a-4555-9bf5-e42af04b5c5c"
      name                     = "Allowed resource types"
      display_name             = "Allowed resource types"
      description              = "This policy enables you to specify the resource types that your organization can deploy. Only resource types that support 'tags' and 'location' will be affected by this policy. To restrict all resources please duplicate this policy and change the 'mode' to 'All'."
      define_resource_selector = false
      enforce                  = true
      location                 = "Central india"
      parameters = jsonencode({
        listOfResourceTypesAllowed = {
          value = ["locations"]
        }
      })
    }
  }
}
