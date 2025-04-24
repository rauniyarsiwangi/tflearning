module "policy005" {
  source           = "../../../tfs-modules/azurerm_policy_assignment"
  assignment_scope = "mg"
  mg_name          = "rbl-dev"
  policy_def_config = {
    "policy1" = {
      policy_definition_id     = "/providers/Microsoft.Authorization/policyDefinitions/1e30110a-5ceb-460c-a204-c1c3969c6d62"
      name                     = "Require a tag"
      display_name             = "Require a tag and its value on resources"
      description              = "Enforces a required tag and its value. Does not apply to resource groups."
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
