resource "azurerm_resource_group" "this" {
  name = "vnet"
  location = var.location

  tags = local.common_tags
}

resource "azurerm_virtual_network" "this" {
  name = "vnet-terraform"
  location = var.location
  resource_group_name = azurerm_resource_group.this.name
  address_space = ["10.0.0.0/16"]

  tags = local.common_tags
}

resource "azurerm_subnet" "public" {
  name = "subnet-terraform"
  resource_group_name = azurerm_resource_group.this.name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes = ["10.0.1.0/24"]
}

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
  subnet_id = azurerm_subnet.public.id
  network_security_group_id = azurerm_network_security_group.this.id
}