terraform {
  backend "azurerm" {
    resource_group_name = "remote-state"
    storage_account_name = "alexremotestateterraform"
    container_name = "remote-state"
    key = "azure-resource-group-null-resource/terraform.tfstate"
  }
}





