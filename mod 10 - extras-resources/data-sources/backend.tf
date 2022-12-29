terraform {
  backend "s3" {
    bucket = "alexandre-remotestate-terraform"
    key    = "aws-vpc-data-source/terraform.tfstate"
    region = "us-east-1"
  }
}