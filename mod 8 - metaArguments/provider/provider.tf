terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.12.1"
    }
  }
}

provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      owner      = "Alexandre"
      managed-by = "terraform"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
  alias = "eua"

  default_tags {
    tags = {
      owner      = "Alexandre"
      managed-by = "terraform"
    }
  }
}
