module "policy009" {
  source           = "../../../tfs-modules/azurerm_policy_assignment"
  assignment_scope = "mg"
  mg_name          = "rbl-dev"
  policy_def_config = {
    "policy1" = {
      policy_definition_id     = "/providers/Microsoft.Authorization/policyDefinitions/36fd7371-8eb7-4321-9c30-a7100022d048"
      name                     = "specific tag"
      display_name             = "Requires resources to not have a specific tag."
      description              = "Denies the creation of a resource that contains the given tag. Does not apply to resource groups."
      define_resource_selector = false
      enforce                  = true
      location                 = "Central india"
      parameters = jsonencode({
        tagName = {
          value = "terraform=1"
        }
      })
    }
  }
}
