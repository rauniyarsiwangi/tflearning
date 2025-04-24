#Azure Provider 
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.55.0"
    }
  }
}

provider "azurerm" {
  features {}
  client_id       = var.clientid
  client_secret   = var.clientsecret
  tenant_id       = var.tenantid
  subscription_id = var.tnn-preprod-subscription-id
}
