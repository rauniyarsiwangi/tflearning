# output "id" {
#   value = azurerm_kubernetes_cluster.k8s.id
# }

# output "kube_config" {
#   value     = azurerm_kubernetes_cluster.k8s.kube_config_raw
#   sensitive = true
# }

# output "client_key" {
#   value     = azurerm_kubernetes_cluster.k8s.kube_config.0.client_key
#   sensitive = true
# }

# output "client_certificate" {
#   value     = azurerm_kubernetes_cluster.k8s.kube_config.0.client_certificate
#   sensitive = true
# }

# output "cluster_ca_certificate" {
#   value     = azurerm_kubernetes_cluster.k8s.kube_config.0.cluster_ca_certificate
#   sensitive = true
# }

# output "host" {
#   value     = azurerm_kubernetes_cluster.k8s.kube_config.0.host
#   sensitive = true
# }


# output "aks_subnet_id" {
#   value = azurerm_subnet.aks-subnet.id
# }


# output "aks_vnet_id" {
#   value = azurerm_virtual_network.aks-vnet.id
# }

# output "resource_group_name" {
#   #value = azurerm_kubernetes_cluster.k8s.resource_group_name
#   value = azurerm_resource_group.rg.name
# }

# output "location" {
#   #value = azurerm_kubernetes_cluster.k8s.location
#   value = azurerm_resource_group.rg.location
# }

# output "tags" {
#   value = var.tags
# }

# output "aks_cluster_name" {
#   value = azurerm_kubernetes_cluster.k8s.name
# }
# output "akv_identity" {
#   value = azurerm_user_assigned_identity.akv_identity.name
# }

# output "akv_identity_principal_id" {
#   value = azurerm_user_assigned_identity.akv_identity.principal_id
# }
