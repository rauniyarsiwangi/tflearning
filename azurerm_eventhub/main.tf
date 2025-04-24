locals {
  resource_group_name = element(coalescelist(data.azurerm_resource_group.rg.*.name, azurerm_resource_group.rg.*.name, [""]), 0)
  location            = element(coalescelist(data.azurerm_resource_group.rg.*.location, azurerm_resource_group.rg.*.location, [""]), 0)
  #  availability_set_id = element(coalescelist(data.azurerm_availability_set.as.*.id, azurerm_availability_set.as.*.id, [""]), 0)
}

data "azurerm_resource_group" "rg" {
  count = var.create_resource_group == false ? 1 : 0
  name  = var.resource_group_name
}

resource "azurerm_resource_group" "rg" {
  count    = var.create_resource_group == true ? 1 : 0
  location = var.location
  name     = var.resource_group_name
}

resource "azurerm_eventhub_namespace" "namespace" {
  name                          = var.namespace_name
  location                      = local.location
  resource_group_name           = local.resource_group_name
  sku                           = var.sku
  capacity                      = var.capacity
  zone_redundant                = var.zone_redundant == false ? false : var.zone_redundant
  public_network_access_enabled = var.public_network_access_enabled == true ? true : var.public_network_access_enabled
  tags                          = var.tags
  minimum_tls_version           = var.minimum_tls_version
  auto_inflate_enabled          = var.auto_inflate_enabled
  identity {
    type = var.identity_type
  }
  lifecycle {
    ignore_changes = [auto_inflate_enabled, identity]
  }
}


# resource "azurerm_eventhub" "eventhub" {
#   for_each            = var.event_name
#   name                = each.value["name"]
#   namespace_name      = azurerm_eventhub_namespace.namespace.name
#   resource_group_name = local.resource_group_name
#   partition_count     = each.value["partition_count"]
#   message_retention   = each.value["message_retention"]
#   status              = each.value["event_status"] == "Active" ? "Active" : each.value["event_status"]
#   capture_description {
#     enabled = var.enabled == null ? true : false
#     encoding = var.encoding == null ? "Avro" : "AvroDeflate"
#     destination {
#       name = "EventHubArchive.AzureBlockBlob"
#     }
#   }
#   lifecycle {
#     ignore_changes = [ message_retention,capture_description ]
#   }
# }

resource "azurerm_eventhub" "eventhub" {
  for_each            = var.event_name
  name                = each.value["name"]
  namespace_name      = azurerm_eventhub_namespace.namespace.name
  resource_group_name = local.resource_group_name
  partition_count     = each.value["partition_count"]
  message_retention   = each.value["message_retention"]
  status              = each.value["event_status"] == "Active" ? "Active" : each.value["event_status"]


  dynamic "capture_description" {
    for_each = var.enabled == true ? [var.enabled] : []
    content {
      enabled  = var.enabled == null ? true : false
      encoding = var.encoding == null ? "Avro" : "AvroDeflate"

      destination {
        name                = "EventHubArchive.AzureBlockBlob"
        archive_name_format = "{Namespace}/{EventHub}/{PartitionId}/{Year}/{Month}/{Day}/{Hour}/{Minute}/{Second}"
        blob_container_name = var.blob_container_name
        storage_account_id  = var.storage_account_id
      }
    }
  }

  lifecycle {
    ignore_changes = [message_retention, capture_description]
  }
}
