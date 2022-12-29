resource "aws_vpc" "this" {
  cidr_block = "10.0.0.0/16"

  tags = {
    "Name" = "vpc-east"
  }
}

resource "aws_vpc" "central" {
  cidr_block = "192.168.0.0/16"
  provider = aws.eua

  tags = {
    "Name" = "vpc-central"
  }
}