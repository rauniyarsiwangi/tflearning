module "policy004" {
  source           = "../../../tfs-modules/azurerm_policy_assignment"
  assignment_scope = "mg"
  mg_name          = "rbl-production"
  enable_identity  = true
  policy_def_config = {
    "policy1" = {
      policy_definition_id     = "/providers/Microsoft.Authorization/policyDefinitions/40df99da-1232-49b1-a39a-6da8d878f469"
      name                     = "Inherit a tag"
      display_name             = "Inherit a tag from the subscription if missing"
      description              = "Adds the specified tag with its value from the containing subscription when any resource missing this tag is created or updated. Existing resources can be remediated by triggering a remediation task. If the tag exists with a different value it will not be changed."
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
