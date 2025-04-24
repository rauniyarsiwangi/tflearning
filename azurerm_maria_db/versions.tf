# terraform {
#   required_providers {
#     azurerm = {
#       source  = "hashicorp/azurerm"
#       version = "3.29.1"
#     }
#     random = {
#       source  = "hashicorp/random"
#       version = ">= 3.1.0"
#     }
#   }
#   required_version = ">= 0.13"
# }

# provider "azurerm" {
#   features {}
# }
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.57.0"
    }
  }
}

provider "azurerm" {
  features {}
}