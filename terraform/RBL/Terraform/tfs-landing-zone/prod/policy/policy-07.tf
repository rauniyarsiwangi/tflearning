module "policy007" {
  source           = "../../../tfs-modules/azurerm_policy_assignment"
  assignment_scope = "mg"
  mg_name          = "rbl-production"
  policy_def_config = {
    "policy1" = {
      policy_definition_id     = "/providers/Microsoft.Authorization/policyDefinitions/96670d01-0a4d-4649-9c89-2d3abc0a5025"
      name                     = "Require a tag on rg"
      display_name             = "Require a tag on resource groups"
      description              = "Enforces existence of a tag on resource groups."
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
