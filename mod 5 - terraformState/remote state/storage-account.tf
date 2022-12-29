resource "azurerm_resource_group" "this" {
  name = "remote-state"
  location = var.location

  tags = local.common_tags
}

resource "azurerm_storage_account" "this" {
  name = "alexremotestateterraform"
  resource_group_name = azurerm_resource_group.this.name
  location = var.location
  account_tier = var.account_tier
  account_replication_type = var.account_replication_type

  blob_properties {
    versioning_enabled = false
  }

  tags = local.common_tags
}

resource "azurerm_storage_container" "this" {
  name = "remote-state"
  storage_account_name = azurerm_storage_account.this.name
}