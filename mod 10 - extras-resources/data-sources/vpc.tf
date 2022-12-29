resource "aws_subnet" "public" {
  vpc_id     = data.aws_vpc.vpc_data.id
  cidr_block = "172.31.0.0/20"

  tags = {
    "Name" = "subnet-terraform"
  }
}
