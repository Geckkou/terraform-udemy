terraform {
  backend "s3" {
    bucket = "alexandre-remotestate-terraform"
    key    = "aws-provider/terraform.tfstate"
    region = "us-east-1"
  }
}