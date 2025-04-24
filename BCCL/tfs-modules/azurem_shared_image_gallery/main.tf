resource "azurerm_shared_image_gallery" "image" {
  name                = var.gallery_name
  resource_group_name = var.resource_group_name
  location            = var.location
  description         = var.description
  tags                = var.tags
#   lifecycle {
#     ignore_changes = [sharing, community_gallery]
#   }
}
