module "policy013" {
  source           = "../../../tfs-modules/azurerm_policy_assignment"
  assignment_scope = "mg"
  mg_name          = "rbl-pre-production"
  policy_def_config = {
    "policy1" = {
      policy_definition_id     = "/providers/Microsoft.Authorization/policyDefinitions/7433c107-6db4-4ad1-b57a-a76dce0154a1"
      name                     = "Storage accounts SKUs"
      display_name             = "Storage accounts should be limited by allowed SKUs"
      description              = "Restrict the set of storage account SKUs that your organization can deploy."
      define_resource_selector = false
      enforce                  = true
      location                 = "Central india"
      parameters = jsonencode({
        listOfAllowedSKUs = {
          value = ["Standard_LRS"]
        }
      })
    }
  }
}
