module "policy006" {
  source           = "../../../tfs-modules/azurerm_policy_assignment"
  assignment_scope = "mg"
  mg_name          = "rbl-production"
  enable_identity  = true
  policy_def_config = {
    "policy1" = {
      policy_definition_id     = "/providers/Microsoft.Authorization/policyDefinitions/b27a0cbd-a167-4dfa-ae64-4337be671140"
      name                     = "Inherit a tag from sub"
      display_name             = "Inherit a tag from the subscription"
      description              = "Adds or replaces the specified tag and value from the containing subscription when any resource is created or updated. Existing resources can be remediated by triggering a remediation task."
      define_resource_selector = false
      enforce                  = true
      location                 = "Central india"
      type                     = "SystemAssigned"
      parameters = jsonencode({
        tagName = {
          value = "terraform=1"
        }
      })
    }
  }
}
