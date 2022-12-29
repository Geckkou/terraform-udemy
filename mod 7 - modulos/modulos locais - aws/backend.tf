terraform {
  backend "s3" {
    bucket = "alexandre-remotestate-terraform"
    key    = "aws-vm-modulo-local/terraform.tfstate"
    region = "us-east-1"
  }
}