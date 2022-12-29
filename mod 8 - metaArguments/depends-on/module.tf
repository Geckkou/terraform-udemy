module "network" {
  depends_on = [
    azurerm_resource_group.this,
  ]

  source = "Azure/network/azurerm"
  version = "3.5.0"

  resource_group_name = azurerm_resource_group.this.name
}