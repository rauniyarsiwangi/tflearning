
resource "azurerm_management_group" "mg" {
  display_name               = var.display_name
  parent_management_group_id = var.parent_management_group_id
  subscription_ids           = var.subscription_ids
}

resource "azurerm_role_assignment" "example" {
  scope                = azurerm_management_group.mg.id
  role_definition_name = "Owner"
  principal_id         = var.principal_id
}