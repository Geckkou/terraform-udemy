terraform {
  backend "s3" {
    bucket = "alexandre-remotestate-terraform"
    key    = "aws-vpc-conditional-expressions/terraform.tfstate"
    region = "us-east-1"
  }
}