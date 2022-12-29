resource "aws_vpc" "this" {
  cidr_block = "10.0.0.0/16"

  tags = {
    "Name" = "vpc-terraform"
  }
}

resource "aws_subnet" "public" {
  count = terraform.workspace == "prod" ? 4 : 2

  vpc_id     = aws_vpc.this.id
  cidr_block = cidrsubnet(aws_vpc.this.cidr_block, 8, count.index)

  tags = {
    "Name" = "subnet-terraform-${count.index}"
  }
}
