<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.29.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.29.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_monitor_diagnostic_setting.diagnostic](https://registry.terraform.io/providers/hashicorp/azurerm/3.29.0/docs/resources/monitor_diagnostic_setting) | resource |
| [azurerm_private_dns_a_record.arecord1](https://registry.terraform.io/providers/hashicorp/azurerm/3.29.0/docs/resources/private_dns_a_record) | resource |
| [azurerm_private_endpoint.infra](https://registry.terraform.io/providers/hashicorp/azurerm/3.29.0/docs/resources/private_endpoint) | resource |
| [azurerm_redis_cache.main](https://registry.terraform.io/providers/hashicorp/azurerm/3.29.0/docs/resources/redis_cache) | resource |
| [azurerm_redis_firewall_rule.name](https://registry.terraform.io/providers/hashicorp/azurerm/3.29.0/docs/resources/redis_firewall_rule) | resource |
| [azurerm_resource_group.infra](https://registry.terraform.io/providers/hashicorp/azurerm/3.29.0/docs/resources/resource_group) | resource |
| [azurerm_private_dns_zone.infra](https://registry.terraform.io/providers/hashicorp/azurerm/3.29.0/docs/data-sources/private_dns_zone) | data source |
| [azurerm_private_endpoint_connection.example](https://registry.terraform.io/providers/hashicorp/azurerm/3.29.0/docs/data-sources/private_endpoint_connection) | data source |
| [azurerm_resource_group.infra](https://registry.terraform.io/providers/hashicorp/azurerm/3.29.0/docs/data-sources/resource_group) | data source |
| [azurerm_storage_account.stg](https://registry.terraform.io/providers/hashicorp/azurerm/3.29.0/docs/data-sources/storage_account) | data source |
| [azurerm_subnet.infra](https://registry.terraform.io/providers/hashicorp/azurerm/3.29.0/docs/data-sources/subnet) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_resource_group"></a> [create\_resource\_group](#input\_create\_resource\_group) | Whether to create resource group and use it for all networking resources | `bool` | `true` | no |
| <a name="input_data_persistence_backup_frequency"></a> [data\_persistence\_backup\_frequency](#input\_data\_persistence\_backup\_frequency) | The Backup Frequency in Minutes. Only supported on Premium SKU's. Possible values are: `15`, `30`, `60`, `360`, `720` and `1440` | `number` | `1440` | no |
| <a name="input_data_persistence_backup_max_snapshot_count"></a> [data\_persistence\_backup\_max\_snapshot\_count](#input\_data\_persistence\_backup\_max\_snapshot\_count) | The maximum number of snapshots to create as a backup. Only supported for Premium SKU's | `number` | `1` | no |
| <a name="input_dns_record"></a> [dns\_record](#input\_dns\_record) | The name of the virtual network | `string` | `"oyoredis"` | no |
| <a name="input_enable_data_persistence"></a> [enable\_data\_persistence](#input\_enable\_data\_persistence) | Enable or disbale Redis Database Backup. Only supported on Premium SKU's | `bool` | `false` | no |
| <a name="input_enable_private_endpoint"></a> [enable\_private\_endpoint](#input\_enable\_private\_endpoint) | Manages a Private Endpoint to Azure database for Redis | `bool` | `true` | no |
| <a name="input_existing_private_dns_zone"></a> [existing\_private\_dns\_zone](#input\_existing\_private\_dns\_zone) | Name of the existing private DNS zone | `any` | `null` | no |
| <a name="input_firewall_rules"></a> [firewall\_rules](#input\_firewall\_rules) | Range of IP addresses to allow firewall connections. | <pre>map(object({<br>    start_ip = string<br>    end_ip   = string<br>  }))</pre> | `null` | no |
| <a name="input_location"></a> [location](#input\_location) | The location/region to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table' | `string` | `""` | no |
| <a name="input_log_analytics_workspace_name"></a> [log\_analytics\_workspace\_name](#input\_log\_analytics\_workspace\_name) | The name of log analytics workspace name | `any` | `null` | no |
| <a name="input_logs"></a> [logs](#input\_logs) | Logs that needs to be enabled | <pre>list(object({<br>    name           = string,<br>    enabled        = bool,<br>    retention_days = optional(number),<br>  }))</pre> | <pre>[<br>  {<br>    "enabled": false,<br>    "name": "AuditEvent",<br>    "retention_days": 0<br>  }<br>]</pre> | no |
| <a name="input_metrics"></a> [metrics](#input\_metrics) | metrics that needs to be enabled | <pre>list(object({<br>    name           = optional(string),<br>    enabled        = optional(bool),<br>    retention_days = optional(number),<br>  }))</pre> | <pre>[<br>  {<br>    "enabled": false,<br>    "name": "AllMetrics",<br>    "retention_days": 0<br>  }<br>]</pre> | no |
| <a name="input_patch_schedule"></a> [patch\_schedule](#input\_patch\_schedule) | The window for redis maintenance. The Patch Window lasts for 5 hours from the `start_hour_utc` | <pre>object({<br>    day_of_week    = string<br>    start_hour_utc = number<br>  })</pre> | `null` | no |
| <a name="input_pe_resource_name"></a> [pe\_resource\_name](#input\_pe\_resource\_name) | private endpoint name | `string` | `""` | no |
| <a name="input_private_subnet_address_prefix"></a> [private\_subnet\_address\_prefix](#input\_private\_subnet\_address\_prefix) | The name of the subnet for private endpoints | `any` | `null` | no |
| <a name="input_pse_resource_name"></a> [pse\_resource\_name](#input\_pse\_resource\_name) | name of private service connection | `string` | `""` | no |
| <a name="input_pvt_dns_zone_name"></a> [pvt\_dns\_zone\_name](#input\_pvt\_dns\_zone\_name) | private dns zone name | `string` | `""` | no |
| <a name="input_pvt_rg_name"></a> [pvt\_rg\_name](#input\_pvt\_rg\_name) | private endpoint name | `string` | `""` | no |
| <a name="input_redis_configuration"></a> [redis\_configuration](#input\_redis\_configuration) | Configuration for the Redis instance | <pre>object({<br>    enable_authentication           = optional(bool)<br>    maxmemory_reserved              = optional(number)<br>    maxmemory_delta                 = optional(number)<br>    maxmemory_policy                = optional(string)<br>    maxfragmentationmemory_reserved = optional(number)<br>    notify_keyspace_events          = optional(string)<br>  })</pre> | `null` | no |
| <a name="input_redis_family"></a> [redis\_family](#input\_redis\_family) | The SKU family/pricing group to use. Valid values are `C` (for `Basic/Standard` SKU family) and `P` (for `Premium`) | `map(any)` | <pre>{<br>  "Basic": "C",<br>  "Premium": "P",<br>  "Standard": "C"<br>}</pre> | no |
| <a name="input_redis_instance_name"></a> [redis\_instance\_name](#input\_redis\_instance\_name) | The name of the Redis instance | `string` | `""` | no |
| <a name="input_redis_server_settings"></a> [redis\_server\_settings](#input\_redis\_server\_settings) | optional redis server setttings for both Premium and Standard/Basic SKU | <pre>object({<br>    name                          = string<br>    capacity                      = number<br>    family                        = string<br>    sku_name                      = string<br>    redis_version                 = number<br>    enable_non_ssl_port           = optional(bool)<br>    minimum_tls_version           = optional(string)<br>    public_network_access_enabled = optional(bool)<br>    replicas_per_master           = optional(number)<br>    shard_count                   = optional(number)<br>    zones                         = optional(list(string))<br>  })</pre> | `null` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | A container that holds related resources for an Azure solution | `string` | `""` | no |
| <a name="input_stg_rg_name"></a> [stg\_rg\_name](#input\_stg\_rg\_name) | The name of the storage account name | `string` | `"zp-oyo-common"` | no |
| <a name="input_storage_account_id"></a> [storage\_account\_id](#input\_storage\_account\_id) | Id of the storage | `string` | n/a | yes |
| <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name) | The name of the storage account name | `string` | `""` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | The ID of the Subnet within which the Redis Cache should be deployed. Only available when using the Premium SKU | `any` | `null` | no |
| <a name="input_subnet_name"></a> [subnet\_name](#input\_subnet\_name) | Name of the Subnet | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources | `map(string)` | `{}` | no |
| <a name="input_virtual_network_name"></a> [virtual\_network\_name](#input\_virtual\_network\_name) | The name of the virtual network | `string` | `"vnet-shared-hub-westeurope-001"` | no |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | Name of the VNET Name | `string` | `""` | no |
| <a name="input_vnet_rg_name"></a> [vnet\_rg\_name](#input\_vnet\_rg\_name) | Name of VNET RG NAME | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_redis_cache_id"></a> [redis\_cache\_id](#output\_redis\_cache\_id) | n/a |
<!-- END_TF_DOCS -->