#------------------------------------------
# Data Sources of Management Group
#------------------------------------------
data "azurerm_management_group" "mg" {
  display_name = var.display_name
}

#------------------------------------------
# Policies for Management Group
#------------------------------------------
resource "azurerm_management_group_policy_assignment" "policies" {
  for_each             = var.policy
  name                 = each.value["name"]
  display_name         = each.value["display_name"]
  description          = each.value["description"]
  policy_definition_id = each.value["policy_definition_id"]
  management_group_id  = data.azurerm_management_group.mg.id
  enforce              = false
  parameters = each.value["list"] == true ? jsonencode({
    (each.value["type"]) : each.value["parameters"]
    }
  ) : null
}

resource "azurerm_management_group_policy_assignment" "polcy_rg" {
  for_each             = var.policy_rg == null ? {} : var.policy_rg
  name                 = each.value["name"]
  display_name         = each.value["display_name"]
  description          = each.value["description"]
  policy_definition_id = each.value["policy_definition_id"]
  management_group_id  = data.azurerm_management_group.mg.id
  enforce              = false
  parameters = each.value["list"] == true ? jsonencode({
    tagName : each.value["parameters"],
    tagValue : each.value["parameters2"]
    }
    ) : jsonencode({
      (each.value["type"]) : each.value["parameters"]
  })
}
