resource "azurerm_resource_group" "this" {
  name = "modulo-remoto"
  location = var.location

  tags = local.common_tags
}

resource "azurerm_public_ip" "this" {
  name = "public-ip-terraform"
  resource_group_name = azurerm_resource_group.this.name
  location = var.location
  allocation_method = "Dynamic"

  tags = local.common_tags
}

resource "azurerm_network_interface" "this" {
  name = "network-interface-terraform"
  location = var.location
  resource_group_name = azurerm_resource_group.this.name

  ip_configuration {
    name = "public-ip-terraform"
    subnet_id = module.network.vnet_subnets[0]
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.this.id
  }

  tags = local.common_tags
}

resource "azurerm_network_interface_security_group_association" "this" {
  network_interface_id = azurerm_network_interface.this.id
  network_security_group_id = azurerm_network_security_group.this.id
}

resource "azurerm_linux_virtual_machine" "this" {
  name = "vm-terraform"
  resource_group_name = azurerm_resource_group.this.name
  location = var.location
  size = "Standard_B1s"
  admin_username = "terraform"
  network_interface_ids = [azurerm_network_interface.this.id]

  admin_ssh_key {
    username = "terraform"
    public_key = file("./azure-terraform.pub")
  }

  os_disk {
    caching = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer = "UbuntuServer"
    sku = "18.04-LTS"
    version = "latest"
  }

  tags = local.common_tags
}