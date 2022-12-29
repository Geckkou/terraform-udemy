output "location-resource-group-eua" {
  value = azurerm_resource_group.this["EUA"].location
}

output "location-resource-group-europa" {
  value = azurerm_resource_group.this["Europa"].location
}

output "location-resource-group-asia" {
  value = azurerm_resource_group.this["Asia"].location
}