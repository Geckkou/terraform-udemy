resource "aws_vpc" "this" {
  cidr_block = "10.0.0.0/16"

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    "Name" = "vpc-east"
  }
}

resource "aws_vpc" "central" {
  cidr_block = "192.168.0.0/16"

  lifecycle {
    ignore_changes = [
      tags,
    ]
  }

  tags = {
    "Name" = "vpc-central"
  }
}