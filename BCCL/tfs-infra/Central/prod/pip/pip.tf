module "pip" {
  source                = "../../../../tfs-modules/azurerm_public_ip"
  pip_name              = "pip-ci-central-prd-shs-002"
  resource_group_name   = "rsg-ci-central-prd-shs-001"
  location              = "Central india"
  pip_allocation_method = "Static"
  pip_sku               = "Standard"
}
