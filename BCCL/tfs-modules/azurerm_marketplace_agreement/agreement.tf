resource "azurerm_marketplace_agreement" "ubuntu-16" {
  publisher = "canonical"
  offer     = "0001-com-ubuntu-pro-xenial"
  plan      = "pro-16_04-lts-gen2"
}

resource "azurerm_marketplace_agreement" "ubuntu-18" {
  publisher = "canonical"
  offer     = "0001-com-ubuntu-pro-bionic"
  plan      = "pro-18_04-lts-gen2"
}

resource "azurerm_marketplace_agreement" "ubuntu-14" {
  publisher = "canonical"
  offer     = "0001-com-ubuntu-pro-trusty"
  plan      = "pro-14_04-lts"
}

resource "azurerm_marketplace_agreement" "fedora" {
  publisher = "solvedevops1643693563360"
  offer     = "fedora-linux-38"
  plan      = "plan001"
}