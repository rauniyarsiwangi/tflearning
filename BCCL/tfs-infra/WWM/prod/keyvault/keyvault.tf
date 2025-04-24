module "akv" {
  source      = "../../../../tfs-modules/azurerm_key_vault"
  kv_rg_name  = "rsg-ci-wwm-prd-shs-01"
  kv_name     = "kv-ci-wwm-prd-shs-01"
  location    = "Central india"
  kv_sku_name = "standard"
  kv_devops   = {}
  tags        = {}
}
