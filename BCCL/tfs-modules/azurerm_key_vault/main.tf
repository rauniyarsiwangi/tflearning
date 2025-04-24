data "azurerm_client_config" "current" {}

data "azurerm_resource_group" "key-vault" {
  name = var.kv_rg_name
}

resource "azurerm_key_vault" "keyvault" {
  name                            = var.kv_name
  location                        = var.location
  resource_group_name             = data.azurerm_resource_group.key-vault.name
  tenant_id                       = data.azurerm_client_config.current.tenant_id
  sku_name                        = var.kv_sku_name
  soft_delete_retention_days      = var.soft_delete_retention_days
  enabled_for_deployment          = var.enabled_for_deployment
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption
  enabled_for_template_deployment = var.enabled_for_template_deployment
  purge_protection_enabled        = var.purge_protection_enabled

  dynamic "access_policy" {
    for_each = var.kv_devops
    content {
      tenant_id               = data.azurerm_client_config.current.tenant_id
      object_id               = access_policy.value["object_id"]
      key_permissions         = access_policy.value["key_permissions"]
      secret_permissions      = access_policy.value["secret_permissions"]
      certificate_permissions = access_policy.value["certificate_permissions"]
    }
  }
  lifecycle {
    ignore_changes = [access_policy, tags,purge_protection_enabled, enabled_for_deployment, enabled_for_disk_encryption, enabled_for_template_deployment,public_network_access_enabled]
  }
  tags = var.tags
}
