module "policy008" {
  source           = "../../../tfs-modules/azurerm_policy_assignment"
  assignment_scope = "mg"
  mg_name          = "rbl-uat"
  policy_def_config = {
    "policy1" = {
      policy_definition_id     = "/providers/Microsoft.Authorization/policyDefinitions/8ce3da23-7156-49e4-b145-24f95f9dcb46"
      name                     = "Require a tag on rgs"
      display_name             = "Require a tag and its value on resource groups"
      description              = "Enforces a required tag and its value on resource groups.."
      define_resource_selector = false
      enforce                  = true
      location                 = "Central india"
      parameters = jsonencode({
        tagName = {
          value = "terraform=1"
        },
        tagValue = {
          value = "terraform=1"
        },
      })
    }
  }
}
