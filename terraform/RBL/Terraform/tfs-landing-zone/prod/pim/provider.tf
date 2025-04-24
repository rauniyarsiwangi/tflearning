terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.85.0"
    }
  }
}

provider "azurerm" {
  features {}
  # client_id       = var.clientid
  # client_secret   = var.clientsecret
  # tenant_id       = var.tenantid
  subscription_id = "e2470aef-5dbd-4e01-bece-4abc90b8d719"
}
