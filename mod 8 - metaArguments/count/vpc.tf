resource "aws_vpc" "this" {
  cidr_block = "10.0.0.0/16"

  tags = {
    "Name" = "vpc-terraform"
  }
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.this.id
  cidr_block = "10.0.${count.index}.0/24"

  count = 3

  tags = {
    "Name" = "subnet-terraform-${count.index}"
  }
}

