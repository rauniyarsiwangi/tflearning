
resource "azurerm_management_group" "mg" {
  display_name               = var.display_name
  parent_management_group_id = var.parent_management_group_id
  subscription_ids           = var.subscription_ids
}


resource "azurerm_user_assigned_identity" "mi" {
  for_each            = var.enable_rbac == true && var.create_mi == true ? { "mi_key" = true } : {}
  location            = var.location
  name                = var.mi_name
  resource_group_name = var.rg_name
}

data "azuread_user" "user" {
  count               = var.existing_user == true ? 1 : 0
  user_principal_name = var.user_principal_name
}

resource "azurerm_role_assignment" "role" {
  for_each             = var.enable_rbac == true ? var.mg_role : {}
  scope                = azurerm_management_group.mg.id
  role_definition_name = each.value["role_definition_name"]
  principal_id         = var.user_principal_name == null ? azurerm_user_assigned_identity.mi["mi_key"].principal_id : data.azuread_user.user.0.object_id
  depends_on           = [azurerm_management_group.mg]
}
