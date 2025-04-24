locals {
  resource_group_name            = element(coalescelist(data.azurerm_resource_group.infra.*.name, azurerm_resource_group.infra.*.name, [""]), 0)
  location                       = element(coalescelist(data.azurerm_resource_group.infra.*.location, azurerm_resource_group.infra.*.location, [""]), 0)
  app_insights_connection_string = azurerm_application_insights.app_insights.*.connection_string
}


data "azurerm_resource_group" "infra" {
  count = var.create_resource_group == false ? 1 : 0
  name  = var.resource_group_name
}

resource "azurerm_resource_group" "infra" {
  count    = var.create_resource_group ? 1 : 0
  name     = var.resource_group_name
  location = var.location

}

data "azurerm_subnet" "infra" {
  for_each             = var.vnet_integration == true ? var.subnets : {}
  name                 = each.value["name"]
  virtual_network_name = each.value["virtual_network_name"]
  resource_group_name  = each.value["resource_group_name"]
}

data "azurerm_storage_account" "stg" {
  name                = var.stg_name
  resource_group_name = var.storage_rg_name
}

data "azurerm_app_service_plan" "asp" {
  count               = var.existing_asp == true ? 1 : 0
  name                = var.plan_name
  resource_group_name = var.asp_rg_name
}

resource "azurerm_app_service_plan" "asp" {
  count               = var.existing_asp == true ? 0 : 1
  name                = var.plan_name
  location            = var.location
  resource_group_name = var.resource_group_name
  kind                = var.kind == "" ? "Windows" : "linux"
  reserved            = var.kind == "" ? false : true

  sku {
    tier = var.tier
    size = var.size
  }
}

resource "azurerm_function_app" "function" {
  name                       = var.function_name
  location                   = var.location
  resource_group_name        = var.resource_group_name
  app_service_plan_id        = var.existing_asp == true ? data.azurerm_app_service_plan.asp[0].id : azurerm_app_service_plan.asp[0].id
  storage_account_name       = data.azurerm_storage_account.stg.name
  storage_account_access_key = data.azurerm_storage_account.stg.primary_access_key
  os_type                    = var.kind
  https_only                 = var.https_only
  version                    = "~4"
  app_settings = {
    FUNCTIONS_WORKER_RUNTIME          = var.functions_runtime
    FUNCTIONS_WORKERS_RUNTIME_VERSION = var.functions_runtime_version
    # To Enabled the Application insigts
    # APPINSIGHTS_INSTRUMENTATIONKEY = azurerm_application_insights.app_insights.0.instrumentation_key
  }
  site_config {
    vnet_route_all_enabled = true
    always_on              = var.always_on
    // Stack settings for .NET version
    linux_fx_version          = var.Stack_version
    elastic_instance_minimum  = 1
    use_32_bit_worker_process = var.use_32_bit_worker_process
  }
  lifecycle {
    ignore_changes = [app_settings, site_config]
  }
}

resource "azurerm_app_service_virtual_network_swift_connection" "appvnet" {
  for_each       = var.vnet_integration == true ? var.subnets : {}
  app_service_id = azurerm_function_app.function.id
  subnet_id      = data.azurerm_subnet.infra[each.value.skey].id
}

resource "azurerm_application_insights" "app_insights" {
  count               = var.enable_app_insights == true ? 1 : 0
  name                = var.app_insights_name
  location            = var.location
  resource_group_name = var.resource_group_name
  application_type    = "web"

  tags = {
    environment = "production"
  }
}