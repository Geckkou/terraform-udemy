resource "azurerm_resource_group" "this" {
  name = "null-resource"
  location = var.location

  tags = local.common_tags
}

resource "null_resource" "provisioner" {
  provisioner "local-exec" {
    command = "echo Resource Group ID: ${azurerm_resource_group.this.id} >> resource-group-id.txt"
  }
}