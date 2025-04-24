module "sig-ci-hub-prd-shs-01" {
  source              = "../../../tfs-modules/azurem_shared_image_gallery"
  gallery_name        = "sig_ci_hub_prd_shs_01"
  location            = "centralindia"
  resource_group_name = "rsg-ci-hub-prd-shs-01"
  description         = "Gallery is to store the golden images"
  tags                = {}
}
