terraform {
  backend "s3" {
    bucket = "alexandre-remotestate-terraform"
    key    = "aws-lifecycle/terraform.tfstate"
    region = "us-east-1"
  }
}