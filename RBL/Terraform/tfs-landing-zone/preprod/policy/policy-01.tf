module "policy001" {
  source           = "../../../tfs-modules/azurerm_policy_assignment"
  assignment_scope = "mg"
  mg_name          = "rbl-pre-production"
  enable_identity  = true
  policy_def_config = {
    "policy1" = {
      policy_definition_id     = "/providers/Microsoft.Authorization/policyDefinitions/726aca4c-86e9-4b04-b0c5-073027359532"
      name                     = "Tag to resource group"
      display_name             = "Add a tag to resource groups"
      description              = "Adds the specified tag and value when any resource group missing this tag is created or updated. Existing resource groups can be remediated by triggering a remediation task. If the tag exists with a different value it will not be changed."
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
