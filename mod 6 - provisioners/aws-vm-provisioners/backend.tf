terraform {
  backend "s3" {
    bucket = "alexandre-remotestate-terraform"
    key    = "aws-vm-provisioners/terraform.tfstate"
    region = "us-east-1"
  }
}