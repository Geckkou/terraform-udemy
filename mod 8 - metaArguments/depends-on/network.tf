resource "azurerm_network_security_group" "this" {
  name = "nsg-terraform"
  location = var.location
  resource_group_name = azurerm_resource_group.this.name

  security_rule {
    name = "SSH"
    priority = 100
    direction = "Inbound"
    access = "Allow"
    protocol = "Tcp"
    source_port_range = "*"
    destination_port_range = "22"
    source_address_prefix = "*"
    destination_address_prefix = "*"
  }

  tags = local.common_tags
}

resource "azurerm_subnet_network_security_group_association" "this" {
  subnet_id = module.network.vnet_subnets[0]
  network_security_group_id = azurerm_network_security_group.this.id
}