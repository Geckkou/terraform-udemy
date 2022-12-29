terraform {
  backend "s3" {
    bucket = "alexandre-remotestate-terraform"
    key    = "aws-vpc-dynamic-blocks/terraform.tfstate"
    region = "us-east-1"
  }
}