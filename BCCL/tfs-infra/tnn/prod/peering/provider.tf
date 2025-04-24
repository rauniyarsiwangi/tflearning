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
  # client_id       = var.clientid
  # client_secret   = var.clientsecret
  # tenant_id       = var.tenantid
   subscription_id = "01613652-02cb-462e-92b3-6f5e84fd4f0b"
}
