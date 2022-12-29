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