module "policy002" {
  source           = "../../../tfs-modules/azurerm_policy_assignment"
  assignment_scope = "mg"
  mg_name          = "rbl-production"
  enable_identity  = true
  policy_def_config = {
    "policy1" = {
      policy_definition_id     = "/providers/Microsoft.Authorization/policyDefinitions/4f9dc7db-30c1-420c-b61a-e1d640128d26"
      name                     = "Tag to resources"
      display_name             = "Add a tag to resources"
      description              = "Adds the specified tag and value when any resource missing this tag is created or updated. Existing resources can be remediated by triggering a remediation task. If the tag exists with a different value it will not be changed. Does not modify tags on resource groups."
      define_resource_selector = false
      enforce                  = true
      location                 = "Central india"
      type                     = "SystemAssigned"
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
