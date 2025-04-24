
locals {
  resource_group_name = element(coalescelist(data.azurerm_resource_group.rg.*.name, azurerm_resource_group.rg.*.name, [""]), 0)
  location            = element(coalescelist(data.azurerm_resource_group.rg.*.location, azurerm_resource_group.rg.*.location, [""]), 0)
  # acr_id              = element(coalescelist(data.azurerm_container_registry.acr.*.id, azurerm_container_registry.acr.*.id, [""]), 0)
}

data "azurerm_resource_group" "rg" {
  count = var.create_resource_group == false ? 1 : 0
  name  = var.resource_group_name
}

resource "azurerm_resource_group" "rg" {
  count    = var.create_resource_group == true ? 1 : 0
  location = var.location
  name     = var.resource_group_name
  tags     = var.tags
}

data "azurerm_resource_group" "vnetrg" {
  name = var.vnet_rg_name
}

resource "azurerm_container_registry" "acr" {
  for_each            = var.create_container_registry == true ? var.acr : {}
  name                = each.value["name"]
  resource_group_name = local.resource_group_name
  location            = local.location
  sku                 = each.value["sku"]
  admin_enabled       = var.admin_enabled
  lifecycle {
    ignore_changes = [admin_enabled, tags]
  }
  tags = var.tags
}

# Create a Subnet for AKS
data "azurerm_subnet" "aks-subnet" {
  name                 = var.subnet_name
  virtual_network_name = var.vnet_name
  resource_group_name  = var.vnet_rg_name
}

# Create User Assigned Identity
resource "azurerm_user_assigned_identity" "akv_identity" {
  location            = local.location
  name                = var.akv_user_identity
  resource_group_name = local.resource_group_name
  tags                = var.tags
}

# Create Azure Kubernetes Cluster
resource "azurerm_kubernetes_cluster" "k8s" {
  name                 = var.cluster_name
  location             = local.location
  resource_group_name  = local.resource_group_name
  kubernetes_version   = var.kubernetes_version
  dns_prefix           = var.dns_prefix
  node_resource_group  = var.node_resource_group
  sku_tier             = var.sku
  azure_policy_enabled = var.azure_policy_enabled
  /* ingress_application_gateway {
     gateway_id = azurerm_application_gateway.application-gateway.id
   }*/

  key_vault_secrets_provider {
    secret_rotation_enabled = var.secret_rotation_enabled
  }

  dynamic "default_node_pool" {
    for_each = var.nodepool
    content {
      name                        = default_node_pool.value["name"]
      enable_auto_scaling         = default_node_pool.value["enable_auto_scaling"]
      max_count                   = default_node_pool.value["max_count"]
      min_count                   = default_node_pool.value["min_count"]
      node_count                  = default_node_pool.value["node_count"]
      vm_size                     = default_node_pool.value["vm_size"]
      os_disk_type                = default_node_pool.value["os_disk_type"]
      zones                       = default_node_pool.value["zones"]
      type                        = default_node_pool.value["type"]
      ultra_ssd_enabled           = default_node_pool.value["ultra_ssd_enabled"]
      os_disk_size_gb             = default_node_pool.value["os_disk_size_gb"]
      vnet_subnet_id              = data.azurerm_subnet.aks-subnet.id
      node_labels                 = default_node_pool.value["agents_labels"]
      max_pods                    = default_node_pool.value["max_pods"]
      temporary_name_for_rotation = default_node_pool.value["temporary_name_for_rotation"]
    }
  }
  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.akv_identity.id]
  }
  network_profile {
    load_balancer_sku = var.network_profile_load_balancer_sku
    network_plugin    = var.network_profile_network_plugin
    # service_cidr      = var.service_cidr
    # dns_service_ip    = var.dns_service_ipsss
  }
  linux_profile {
    admin_username = var.admin_username
    ssh_key {
      key_data = var.key_data
    }
  }
  /* oms_agent {
   log_analytics_workspace_id = var.log_analytics_workspace_id
   msi_auth_for_monitoring_enabled = var.msi_auth_for_monitoring_enabled 
  } */
  tags = var.tags
  /* depends_on = [azurerm_role_assignment.akv_role] */
  lifecycle {
    ignore_changes = [linux_profile, key_vault_secrets_provider, oms_agent, monitor_metrics, microsoft_defender]
  }
}
data "azurerm_client_config" "current" {
}

resource "azurerm_role_assignment" "aks_role_assignment" {
  for_each             = var.create_container_registry == true ? var.acr : {}
  scope                = var.acr_id == null ? azurerm_container_registry.acr[each.key].id : var.acr_id
  role_definition_name = var.role_definition_name
  principal_id         = var.manual_role == true ? var.principal_id : azurerm_user_assigned_identity.akv_identity.principal_id
}

resource "azurerm_role_assignment" "akv_role" {
  scope                = data.azurerm_resource_group.vnetrg.id
  role_definition_name = "Owner"
  principal_id         = azurerm_user_assigned_identity.akv_identity.principal_id
}

resource "azurerm_kubernetes_cluster_node_pool" "cardvault" {
  for_each              = var.attach_usernodepool == true ? var.usernodepull : {}
  kubernetes_cluster_id = azurerm_kubernetes_cluster.k8s.id
  name                  = each.value["name"]
  vm_size               = each.value["vm_size"]
  enable_auto_scaling   = each.value["enable_auto_scaling"]
  max_count             = each.value["max_count"]
  min_count             = each.value["min_count"]
  node_count            = each.value["node_count"]
  os_disk_type          = each.value["os_disk_type"]
  zones                 = each.value["zones"]
  node_labels           = each.value["node_labels"]
  node_taints           = each.value["node_taints"]
  vnet_subnet_id        = data.azurerm_subnet.aks-subnet.id
  os_disk_size_gb       = each.value["os_disk_size_gb"]
  max_pods              = each.value["max_pods"]
  mode                  = each.value["mode"]
  tags                  = var.tags
}
