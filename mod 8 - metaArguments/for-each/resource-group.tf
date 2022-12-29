resource "azurerm_resource_group" "this" {
  for_each = {
    "EUA" = "East US"
    "Europa" = "West Europe"
    "Asia" = "Japan East"
  }
  
  name = each.key
  location = each.value

  tags = local.common_tags
}
