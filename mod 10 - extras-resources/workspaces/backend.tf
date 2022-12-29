terraform {
  backend "s3" {
    bucket = "alexandre-remotestate-terraform"
    key    = "aws-vpc-workspaces/terraform.tfstate"
    region = "us-east-1"
  }
}