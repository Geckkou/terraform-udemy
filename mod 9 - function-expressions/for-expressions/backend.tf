terraform {
  backend "s3" {
    bucket = "alexandre-remotestate-terraform"
    key    = "aws-vpc-for-expressions/terraform.tfstate"
    region = "us-east-1"
  }
}