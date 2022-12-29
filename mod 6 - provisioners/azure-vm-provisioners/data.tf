data "terraform_remote_state" "vnet" {
  backend = "azurerm"
  config = {
    resource_group_name = "remote-state"
    storage_account_name = "alexremotestateterraform"
    container_name = "remote-state"
    key = "azure-vnet/terraform.tfstate"
   }
}