<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | =3.29.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | =3.29.0 |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_key_vault_secret.psql](https://registry.terraform.io/providers/hashicorp/azurerm/3.29.0/docs/resources/key_vault_secret) | resource |
| [azurerm_monitor_diagnostic_setting.diagnostic](https://registry.terraform.io/providers/hashicorp/azurerm/3.29.0/docs/resources/monitor_diagnostic_setting) | resource |
| [azurerm_postgresql_flexible_server.infra](https://registry.terraform.io/providers/hashicorp/azurerm/3.29.0/docs/resources/postgresql_flexible_server) | resource |
| [azurerm_postgresql_flexible_server_configuration.psql-default](https://registry.terraform.io/providers/hashicorp/azurerm/3.29.0/docs/resources/postgresql_flexible_server_configuration) | resource |
| [azurerm_postgresql_flexible_server_configuration.psql-variable](https://registry.terraform.io/providers/hashicorp/azurerm/3.29.0/docs/resources/postgresql_flexible_server_configuration) | resource |
| [azurerm_postgresql_flexible_server_database.psql](https://registry.terraform.io/providers/hashicorp/azurerm/3.29.0/docs/resources/postgresql_flexible_server_database) | resource |
| [azurerm_resource_group.infra](https://registry.terraform.io/providers/hashicorp/azurerm/3.29.0/docs/resources/resource_group) | resource |
| [random_password.psql](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/3.29.0/docs/data-sources/client_config) | data source |
| [azurerm_key_vault.psql](https://registry.terraform.io/providers/hashicorp/azurerm/3.29.0/docs/data-sources/key_vault) | data source |
| [azurerm_private_dns_zone.infra](https://registry.terraform.io/providers/hashicorp/azurerm/3.29.0/docs/data-sources/private_dns_zone) | data source |
| [azurerm_resource_group.infra](https://registry.terraform.io/providers/hashicorp/azurerm/3.29.0/docs/data-sources/resource_group) | data source |
| [azurerm_subnet.infra](https://registry.terraform.io/providers/hashicorp/azurerm/3.29.0/docs/data-sources/subnet) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_username"></a> [admin\_username](#input\_admin\_username) | admin username | `string` | `"my-rg"` | no |
| <a name="input_autostorage"></a> [autostorage](#input\_autostorage) | whether to create a resource group or not | `bool` | `false` | no |
| <a name="input_bkp_retention_days"></a> [bkp\_retention\_days](#input\_bkp\_retention\_days) | Backup retention days | `string` | `"7"` | no |
| <a name="input_create_resource_group"></a> [create\_resource\_group](#input\_create\_resource\_group) | Whether to create resource group and use it for all networking resources | `bool` | `false` | no |
| <a name="input_databases"></a> [databases](#input\_databases) | (Required) The name, collation, and character set of the MySQL database(s). (defaults: charset='utf8', collation='utf8\_unicode\_ci') | `map(map(string))` | n/a | yes |
| <a name="input_kv_pointer_name"></a> [kv\_pointer\_name](#input\_kv\_pointer\_name) | key vault name | `string` | `"psqlkv9278"` | no |
| <a name="input_kv_pointer_psqladmin_password"></a> [kv\_pointer\_psqladmin\_password](#input\_kv\_pointer\_psqladmin\_password) | secrets for postgres username aand password | `string` | `"psqlsectrets"` | no |
| <a name="input_kv_pointer_rg"></a> [kv\_pointer\_rg](#input\_kv\_pointer\_rg) | key vault resource group name | `string` | `"my-rg"` | no |
| <a name="input_logs"></a> [logs](#input\_logs) | Logs that needs to be enabled | <pre>list(object({<br>    name           = string,<br>    enabled        = bool,<br>    retention_days = optional(number),<br>  }))</pre> | <pre>[<br>  {<br>    "enabled": false,<br>    "name": "AuditEvent",<br>    "retention_days": 0<br>  }<br>]</pre> | no |
| <a name="input_metrics"></a> [metrics](#input\_metrics) | metrics that needs to be enabled | <pre>list(object({<br>    name           = optional(string),<br>    enabled        = optional(bool),<br>    retention_days = optional(number),<br>  }))</pre> | <pre>[<br>  {<br>    "enabled": false,<br>    "name": "AllMetrics",<br>    "retention_days": 0<br>  }<br>]</pre> | no |
| <a name="input_mypostgre_fs_name"></a> [mypostgre\_fs\_name](#input\_mypostgre\_fs\_name) | postgre sql flexible server name | `string` | `"postgresqlfs-demo"` | no |
| <a name="input_pvt_dns_zone_name"></a> [pvt\_dns\_zone\_name](#input\_pvt\_dns\_zone\_name) | private dns zone name | `string` | `"privatelink.mysql.database.azure.com"` | no |
| <a name="input_pvt_dns_zone_name_link"></a> [pvt\_dns\_zone\_name\_link](#input\_pvt\_dns\_zone\_name\_link) | private dns zone name link | `string` | `"vnet-private-zone-link"` | no |
| <a name="input_pvt_rg_name"></a> [pvt\_rg\_name](#input\_pvt\_rg\_name) | virtual network | `string` | `"oyo-vnet"` | no |
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input\_resource\_group\_location) | Location of the resource group. | `string` | `"eastus"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the resource group. | `string` | `"my-rg"` | no |
| <a name="input_resource_group_name_prefix"></a> [resource\_group\_name\_prefix](#input\_resource\_group\_name\_prefix) | Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription. | `string` | `"rg"` | no |
| <a name="input_server_parameters_default"></a> [server\_parameters\_default](#input\_server\_parameters\_default) | Map of configuration options: https://learn.microsoft.com/en-us/azure/postgresql/flexible-server/concepts-server-parameters. Merged with default\_server\_parameters local:<pre>log_bin_trust_function_creators = "ON"<br>    connect_timeout                 = 60<br>    interactive_timeout             = 28800<br>    wait_timeout                    = 28800</pre> | `map(string)` | `{}` | no |
| <a name="input_server_parameters_variable"></a> [server\_parameters\_variable](#input\_server\_parameters\_variable) | n/a | `map(string)` | n/a | yes |
| <a name="input_server_ver"></a> [server\_ver](#input\_server\_ver) | server version | `string` | `"13"` | no |
| <a name="input_server_zone"></a> [server\_zone](#input\_server\_zone) | zones | `string` | `"1"` | no |
| <a name="input_size_mb"></a> [size\_mb](#input\_size\_mb) | PSQL Felxible Server Storage Size  in MB | `number` | n/a | yes |
| <a name="input_sku"></a> [sku](#input\_sku) | Server sku | `string` | `"GP_Standard_D2s_v3"` | no |
| <a name="input_standby_availability_zone"></a> [standby\_availability\_zone](#input\_standby\_availability\_zone) | PSQL Felxible Server availability zone | `number` | `2` | no |
| <a name="input_storage_account_id"></a> [storage\_account\_id](#input\_storage\_account\_id) | Id of the storage | `string` | n/a | yes |
| <a name="input_subnet_name"></a> [subnet\_name](#input\_subnet\_name) | Name of Subnet | `string` | `"mysubnet"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource. | `map(string)` | `{}` | no |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | Name of Virtual Network | `string` | `"Demo"` | no |
| <a name="input_vnet_rg_name"></a> [vnet\_rg\_name](#input\_vnet\_rg\_name) | virtual network | `string` | `"oyo-vnet"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_pgsql_flexible_server_id"></a> [pgsql\_flexible\_server\_id](#output\_pgsql\_flexible\_server\_id) | n/a |
<!-- END_TF_DOCS -->