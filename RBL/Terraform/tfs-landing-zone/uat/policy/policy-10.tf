module "policy010" {
  source           = "../../../tfs-modules/azurerm_policy_assignment"
  assignment_scope = "mg"
  mg_name          = "rbl-uat"
  enable_identity  = true
  policy_def_config = {
    "policy1" = {
      policy_definition_id     = "/providers/Microsoft.Authorization/policyDefinitions/ea3f2387-9b95-492a-a190-fcdc54f7b070"
      name                     = "Inherited a tag from rg"
      display_name             = "Inherit a tag from the resource group if missing"
      description              = "Adds the specified tag with its value from the parent resource group when any resource missing this tag is created or updated. Existing resources can be remediated by triggering a remediation task. If the tag exists with a different value it will not be changed."
      define_resource_selector = false
      enforce                  = true
      type                     = "SystemAssigned"
      location                 = "Central india"
      parameters = jsonencode({
        tagName = {
          value = "terraform=1"
        }
      })
    }
  }
}
