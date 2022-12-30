data "terraform_remote_state" "vnet" {
  backend = "azurerm"
  config = {
    resource_group_name = "remote-state"
    storage_account_name = "alexremotestateterraform"
    container_name = "remote-state"
    key = "azure-vnet/terraform.tfstate"
   }
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "alexandre-remotestate-terraform"
    key    = "aws-vpc/terraform.tfstate"
    region = "us-east-1"
   } 
}

data "aws_ami" "ubuntu" {
  owners = ["amazon"]
  most_recent =  true 
  name_regex = "ubuntu"

  filter {
    name = "architecture"
    values = ["x86_64"]
  }
}