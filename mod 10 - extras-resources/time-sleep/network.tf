resource "azurerm_resource_group" "this" {
  name     = "vnet"
  location = var.location

  tags = local.common_tags
}

resource "time_sleep" "this" {
  depends_on = [
    azurerm_resource_group.this,
  ]

  create_duration = "10s"
}

resource "azurerm_virtual_network" "this" {
  depends_on = [
    time_sleep.this,
  ]

  name                = "vnet-terraform-time-sleeṕ"
  location            = var.location
  resource_group_name = azurerm_resource_group.this.name
  address_space       = ["10.0.0.0/16"]

  tags = local.common_tags
}
