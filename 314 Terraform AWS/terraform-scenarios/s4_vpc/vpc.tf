resource "aws_vpc" "vpc_virginia"{
  cidr_block = "10.10.0.0/16"
  tags = {
    Name = "VPC_Virginia"
    Env = "DEV"
  }
}

resource "aws_vpc" "vpc_ohio"{
  cidr_block = "10.10.0.0/16"
  tags = {
    Name = "VPC_Ohio"
    Env = "DEV"
  }
  provider = aws.ohio
}