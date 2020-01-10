## Define VPC
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true

  tags = {
    Name = "vpc main"
  }
}

## Define the public subnets
resource "aws_subnet" "public_subnets" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.public_subnet_cidrs[count.index]
  availability_zone = data.aws_availability_zones.all.names[count.index]
  count             = 2

  tags = {
    Name = "FrontEnd - Public Subnet - ${count.index + 1}"
  }
}

## Define the private subnets
resource "aws_subnet" "private_subnets" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_cidrs[count.index]
  availability_zone = data.aws_availability_zones.all.names[count.index]
  count             = 2

  tags = {
    Name = "BackEnd - Private Subnet - ${count.index + 1}"
  }
}