resource "azurerm_resource_group" "this" {
  name = "storage_account_resource_group"
  location = var.location

  tags = local.common_tags
}

resource "azurerm_storage_account" "this" {
  name = "alexandrestorageaccount"
  resource_group_name = azurerm_resource_group.this.name
  location = var.location
  account_tier = var.account_tier
  account_replication_type = var.account_replication_type

  tags = local.common_tags
}

resource "azurerm_storage_container" "this" {
  name = "alexandrecontainer"
  storage_account_name = azurerm_storage_account.this.name
}