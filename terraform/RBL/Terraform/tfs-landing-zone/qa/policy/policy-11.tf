module "policy011" {
  source           = "../../../tfs-modules/azurerm_policy_assignment"
  assignment_scope = "mg"
  mg_name          = "rbl-qa"
  policy_def_config = {
    "policy1" = {
      policy_definition_id     = "/providers/Microsoft.Authorization/policyDefinitions/e56962a6-4747-49cd-b67b-bf8b01975c4c"
      name                     = "Allowed locations"
      display_name             = "Allowed locations"
      description              = "This policy enables you to restrict the locations your organization can specify when deploying resources. Use to enforce your geo-compliance requirements. Excludes resource groups, Microsoft.AzureActiveDirectory/b2cDirectories, and resources that use the 'global' region."
      define_resource_selector = false
      enforce                  = true
      location                 = "Central india"
      parameters = jsonencode({
        listOfAllowedLocations = {
          value = ["Central india"]
        }
      })
    }
  }
}
