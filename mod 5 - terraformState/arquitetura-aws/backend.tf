terraform {
  backend "s3" {
    bucket = "alexandre-remotestate-terraform"
    key    = "aws-vpc/terraform.tfstate"
    region = "us-east-1"
  }
}