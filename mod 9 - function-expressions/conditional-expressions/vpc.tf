resource "aws_vpc" "this" {
  cidr_block = "10.0.0.0/16"

  count = var.environment == "prod" ? 1 : 0

  tags = {
    "Name" = "vpc-terraform"
  }
}
