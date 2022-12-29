output "vm_ipa_azure" {
  value = azurerm_linux_virtual_machine.this.public_ip_address
}

output "vm_ip_aws" {
  value = aws_instance.vm.public_ip
}