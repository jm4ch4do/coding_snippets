resource "aws_vpc" "vpc_virginia"{
  cidr_block = var.virginia_cidr
  tags = {
    Name = "VPC_Virginia"
    Env = "DEV"
  }
}

resource "aws_vpc" "vpc_ohio"{
  cidr_block = var.ohio_cidr
  tags = {
    Name = "VPC_Ohio"
    Env = "DEV"
  }
  provider = aws.ohio
}
