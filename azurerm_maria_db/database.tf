resource "azurerm_mariadb_database" "maraiadb" {
  for_each            = var.databases
  name                = each.key
  resource_group_name = local.resource_group_name
  server_name         = azurerm_mariadb_server.infra.name
  charset             = lookup(each.value, "charset", "utf8")
  collation           = lookup(each.value, "collation", "utf8_unicode_ci")
  depends_on = [
    azurerm_mariadb_server.infra
  ]
}
resource "azurerm_mariadb_configuration" "infra" {
  for_each = var.server_parameters 
  name                = each.key
  resource_group_name = local.resource_group_name
  server_name         = azurerm_mariadb_server.infra.name
  value               = each.value
  depends_on = [
    azurerm_mariadb_server.infra
  ]
}
