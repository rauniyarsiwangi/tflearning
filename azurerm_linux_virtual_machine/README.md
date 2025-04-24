<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=0.12 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | =3.29.1 |
| <a name="requirement_random"></a> [random](#requirement\_random) | =3.4.3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | =3.29.1 |
| <a name="provider_random"></a> [random](#provider\_random) | =3.4.3 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_key_vault_secret.vm](https://registry.terraform.io/providers/hashicorp/azurerm/3.29.1/docs/resources/key_vault_secret) | resource |
| [azurerm_linux_virtual_machine.vm](https://registry.terraform.io/providers/hashicorp/azurerm/3.29.1/docs/resources/linux_virtual_machine) | resource |
| [azurerm_managed_disk.data_disk](https://registry.terraform.io/providers/hashicorp/azurerm/3.29.1/docs/resources/managed_disk) | resource |
| [azurerm_network_interface.nic](https://registry.terraform.io/providers/hashicorp/azurerm/3.29.1/docs/resources/network_interface) | resource |
| [azurerm_public_ip.vm](https://registry.terraform.io/providers/hashicorp/azurerm/3.29.1/docs/resources/public_ip) | resource |
| [azurerm_resource_group.vm](https://registry.terraform.io/providers/hashicorp/azurerm/3.29.1/docs/resources/resource_group) | resource |
| [azurerm_virtual_machine_data_disk_attachment.vm](https://registry.terraform.io/providers/hashicorp/azurerm/3.29.1/docs/resources/virtual_machine_data_disk_attachment) | resource |
| [random_password.vm](https://registry.terraform.io/providers/hashicorp/random/3.4.3/docs/resources/password) | resource |
| [azurerm_key_vault.vm](https://registry.terraform.io/providers/hashicorp/azurerm/3.29.1/docs/data-sources/key_vault) | data source |
| [azurerm_resource_group.vm](https://registry.terraform.io/providers/hashicorp/azurerm/3.29.1/docs/data-sources/resource_group) | data source |
| [azurerm_ssh_public_key.vm](https://registry.terraform.io/providers/hashicorp/azurerm/3.29.1/docs/data-sources/ssh_public_key) | data source |
| [azurerm_subnet.subnet](https://registry.terraform.io/providers/hashicorp/azurerm/3.29.1/docs/data-sources/subnet) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_as"></a> [as](#input\_as) | availability set name | `string` | `""` | no |
| <a name="input_availability_set_id"></a> [availability\_set\_id](#input\_availability\_set\_id) | availability set | `any` | n/a | yes |
| <a name="input_caching_type"></a> [caching\_type](#input\_caching\_type) | Type of caching | `string` | `"ReadWrite"` | no |
| <a name="input_create_public_ip"></a> [create\_public\_ip](#input\_create\_public\_ip) | bool type to create a public ip for a virtual machine. | `bool` | `"false"` | no |
| <a name="input_create_resource_group"></a> [create\_resource\_group](#input\_create\_resource\_group) | bool type of data to create resource group. | `bool` | `"false"` | no |
| <a name="input_creation_opt"></a> [creation\_opt](#input\_creation\_opt) | data disk size in giga byte. | `string` | `"Empty"` | no |
| <a name="input_data_disk_lun"></a> [data\_disk\_lun](#input\_data\_disk\_lun) | Lun required to attach multiple disk to vm | `number` | `"10"` | no |
| <a name="input_data_disk_name"></a> [data\_disk\_name](#input\_data\_disk\_name) | name of managed disk want to create from snapshot | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| <a name="input_data_disk_storage_acc_type"></a> [data\_disk\_storage\_acc\_type](#input\_data\_disk\_storage\_acc\_type) | type of storage account for disk | `string` | `"Standard_LRS"` | no |
| <a name="input_data_disk_type"></a> [data\_disk\_type](#input\_data\_disk\_type) | Defines the disk type to be created. Valid options are Standard\_LRS, StandardSSD\_LRS & Premium\_LRS. | `string` | `"Standard_LRS"` | no |
| <a name="input_disable_as"></a> [disable\_as](#input\_disable\_as) | disable availability set | `bool` | `true` | no |
| <a name="input_disable_kv"></a> [disable\_kv](#input\_disable\_kv) | disable key vault | `bool` | `true` | no |
| <a name="input_disk_size_gb"></a> [disk\_size\_gb](#input\_disk\_size\_gb) | data disk size in giga byte. | `string` | n/a | yes |
| <a name="input_disk_type"></a> [disk\_type](#input\_disk\_type) | data disk size in giga byte. | `string` | `"StandardSSD_LRS"` | no |
| <a name="input_enable_accelerated_networking"></a> [enable\_accelerated\_networking](#input\_enable\_accelerated\_networking) | (Optional) Enable accelerated networking on Network interface. | `bool` | `true` | no |
| <a name="input_image_version"></a> [image\_version](#input\_image\_version) | image version | `string` | `"latest"` | no |
| <a name="input_kv_pointer_name"></a> [kv\_pointer\_name](#input\_kv\_pointer\_name) | Name of key vault | `string` | `""` | no |
| <a name="input_kv_pointer_rg"></a> [kv\_pointer\_rg](#input\_kv\_pointer\_rg) | Name of resource group for key vault | `string` | `""` | no |
| <a name="input_os_disk_size_gb"></a> [os\_disk\_size\_gb](#input\_os\_disk\_size\_gb) | os disk size in giga byte. | `string` | `"1"` | no |
| <a name="input_os_disk_type"></a> [os\_disk\_type](#input\_os\_disk\_type) | Defines the disk type to be created. Valid options are Standard\_LRS, StandardSSD\_LRS & Premium\_LRS. | `string` | `"Standard_LRS"` | no |
| <a name="input_os_offer"></a> [os\_offer](#input\_os\_offer) | data disk size in  GB | `string` | `"UbuntuServer"` | no |
| <a name="input_os_publisher"></a> [os\_publisher](#input\_os\_publisher) | data disk size in  GB | `string` | `"Canonical"` | no |
| <a name="input_os_sku"></a> [os\_sku](#input\_os\_sku) | sku of the VM | `string` | `"18_04-lts-gen2"` | no |
| <a name="input_os_type"></a> [os\_type](#input\_os\_type) | data disk size in giga byte. | `string` | `"Linux"` | no |
| <a name="input_pip_add_allocation"></a> [pip\_add\_allocation](#input\_pip\_add\_allocation) | private ip address | `string` | `"Dynamic"` | no |
| <a name="input_private_ip_address"></a> [private\_ip\_address](#input\_private\_ip\_address) | private ip address | `string` | `""` | no |
| <a name="input_public_ip_allocation_method"></a> [public\_ip\_allocation\_method](#input\_public\_ip\_allocation\_method) | Allocation method of the public IP address | `string` | `"Static"` | no |
| <a name="input_public_ip_domain_name_label"></a> [public\_ip\_domain\_name\_label](#input\_public\_ip\_domain\_name\_label) | Domain name label of the public IP address | `string` | `""` | no |
| <a name="input_public_ip_name"></a> [public\_ip\_name](#input\_public\_ip\_name) | Name of the public IP address | `string` | `"vm-publicip"` | no |
| <a name="input_public_ip_sku"></a> [public\_ip\_sku](#input\_public\_ip\_sku) | SKU of the public IP address | `string` | `"Standard"` | no |
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input\_resource\_group\_location) | Location of the resource group. | `string` | `"Australia East"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | resource\_group\_name | `string` | n/a | yes |
| <a name="input_secret_name"></a> [secret\_name](#input\_secret\_name) | Name of resource group for key vault | `string` | `""` | no |
| <a name="input_ssh_key"></a> [ssh\_key](#input\_ssh\_key) | Azure SSH Key Name | `string` | `"ubuntu_prod_pem_v1"` | no |
| <a name="input_sshkey_rg"></a> [sshkey\_rg](#input\_sshkey\_rg) | SSH Key resource group name | `string` | `"mongo"` | no |
| <a name="input_subnet_name"></a> [subnet\_name](#input\_subnet\_name) | Subnet Name | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of the tags to use on the resources that are deployed with this module. | `map(string)` | <pre>{<br>  "source": "terraform"<br>}</pre> | no |
| <a name="input_username"></a> [username](#input\_username) | The admin username of the VM that will be deployed. | `string` | `"ubuntu"` | no |
| <a name="input_vm_name"></a> [vm\_name](#input\_vm\_name) | virtual machine Name | `string` | `"linux_vm"` | no |
| <a name="input_vm_size"></a> [vm\_size](#input\_vm\_size) | Specifies the size of the virtual machine. | `string` | `"Standard_B2s"` | no |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | VNET Name | `string` | `""` | no |
| <a name="input_vnet_rg_name"></a> [vnet\_rg\_name](#input\_vnet\_rg\_name) | VNET RG NAME | `string` | `""` | no |
| <a name="input_zone"></a> [zone](#input\_zone) | Zone in which VM will be deployed - Supported value in String 1,2 & 3 | `string` | `""` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->