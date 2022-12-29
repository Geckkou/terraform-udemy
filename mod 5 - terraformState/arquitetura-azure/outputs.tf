output "subnet_id" {
  value = azurerm_subnet.public.id
}

output "vnet_id" {
  value = azurerm_virtual_network.this.id
}

output "security_group_id" {
  value = azurerm_network_security_group.this.id
}