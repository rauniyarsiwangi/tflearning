data "azurerm_management_group" "mg" {
  for_each     = var.assignment_scope == "mg" ? { "mg_key" = true } : {}
  display_name = var.mg_name
}

resource "azurerm_management_group_policy_assignment" "def" {
  for_each             = var.assignment_scope == "mg" ? var.policy_def_config : {}
  policy_definition_id = each.value["policy_definition_id"]
  name                 = each.value["name"]
  display_name         = each.value["display_name"]
  description          = each.value["description"]
  metadata             = each.value["metadata"]
  parameters           = each.value["parameters"]
  management_group_id  = data.azurerm_management_group.mg["mg_key"].id
  not_scopes           = each.value["not_scopes"]
  enforce              = each.value["enforce"]
  location             = each.value["location"]
  non_compliance_message {
    content = each.value["display_name"]
  }

  dynamic "identity" {
    for_each = var.enable_identity == true ? { "identity_key" = true } : {}
    content {
      type = each.value["type"]
    }
  }

  lifecycle {
    ignore_changes = [metadata, parameters]
  }
}

data "azurerm_subscription" "current" {}

resource "azurerm_subscription_policy_assignment" "def" {
  for_each             = var.assignment_scope == "sub" ? var.policy_def_config : {}
  policy_definition_id = each.value["policy_definition_id"]
  name                 = each.value["name"]
  display_name         = each.value["display_name"]
  description          = each.value["description"]
  metadata             = jsonencode(each.value["metadata"])
  parameters           = jsonencode(each.value["parameters"])
  subscription_id      = data.azurerm_subscription.current.id
  not_scopes           = each.value["not_scopes"]
  enforce              = each.value["enforce"]
  location             = each.value["location"]

  non_compliance_message {
    content = each.value["display_name"]
  }

  dynamic "identity" {
    for_each = var.enable_identity == true ? { "identity_key" = true } : {}
    content {
      type = each.value["type"]
    }
  }


  lifecycle {
    ignore_changes = [metadata, parameters]
  }

}

data "azurerm_resource_group" "rg" {
  for_each = var.assignment_scope == "rg" ? { "rg_key" = true } : {}
  name     = var.rg_name
}

resource "azurerm_resource_group_policy_assignment" "def" {
  for_each             = var.assignment_scope == "rg" ? var.policy_def_config : {}
  policy_definition_id = each.value["policy_definition_id"]
  name                 = each.value["name"]
  display_name         = each.value["display_name"]
  description          = each.value["description"]
  metadata             = jsonencode(each.value["metadata"])
  parameters           = jsonencode(each.value["parameters"])
  resource_group_id    = data.azurerm_resource_group.rg[each.key].id
  not_scopes           = each.value["not_scopes"]
  enforce              = each.value["enforce"]
  location             = each.value["location"]
  non_compliance_message {
    content = each.value["display_name"]
  }

  dynamic "identity" {
    for_each = var.enable_identity == true ? { "identity_key" = true } : {}
    content {
      type = each.value["type"]
    }
  }



  lifecycle {
    ignore_changes = [metadata, parameters]
  }
}

resource "azurerm_resource_policy_assignment" "def" {
  for_each             = var.assignment_scope == "res" ? var.policy_def_config : {}
  policy_definition_id = each.value["policy_definition_id"]
  name                 = each.value["name"]
  display_name         = each.value["display_name"]
  description          = each.value["description"]
  metadata             = jsonencode(each.value["metadata"])
  parameters           = jsonencode(each.value["parameters"])
  resource_id          = var.resource_id
  not_scopes           = each.value["not_scopes"]
  enforce              = each.value["enforce"]
  location             = each.value["location"]
  non_compliance_message {
    content = each.value["display_name"]
  }

  dynamic "identity" {
    for_each = var.enable_identity == true ? { "identity_key" = true } : {}
    content {
      type = each.value["type"]
    }
  }


  lifecycle {
    ignore_changes = [metadata, parameters]
  }
}


