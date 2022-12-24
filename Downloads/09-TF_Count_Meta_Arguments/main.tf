# https://developer.hashicorp.com/terraform/language/functions/length
# https://developer.hashicorp.com/terraform/language/meta-arguments/count

data "aws_availability_zones" "available" {}

resource "aws_vpc" "terraform_test_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "terraform_test_vpc"
  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_internet_gateway" "terraform_test_internet_gateway" {
  vpc_id = aws_vpc.terraform_test_vpc.id

  tags = {
    Name = "terraform_test_internet_gateway"
  }
}

resource "aws_route_table" "terraform_public_rt" {
  vpc_id = aws_vpc.terraform_test_vpc.id

  tags = {
    Name = "terraform_test_public_route_table"
  }
}

resource "aws_route" "default_route" {
  route_table_id         = aws_route_table.terraform_public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.terraform_test_internet_gateway.id
}

resource "aws_default_route_table" "terraform_private_rt" {
  default_route_table_id = aws_vpc.terraform_test_vpc.default_route_table_id

  tags = {
    Name = "terraform_private_rt"
  }
}

resource "aws_subnet" "terraform_public_test_subnet" {
  count                   = 2
  //count                   = length(var.public_cidrs)
  vpc_id                  = aws_vpc.terraform_test_vpc.id
  cidr_block              = var.public_cidrs[count.index]
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availablity_zones.available.names[count.index]

  tags = {
    Name = "terraform_public_test_subnet"
  }
}

resource "aws_subnet" "terraform_private_test_subnet" {
  count                   = 2
  //count                   = length(var.private_cidrs)
  vpc_id     = aws_vpc.terraform_test_vpc.id
  cidr_block = var.public_cidrs[count.index]
  map_public_ip_on_launch = false
  availability_zone       = data.aws_availablity_zones.available.names[count.index]

  tags = {
    Name = "terraform_private_test_subnet"
  }
}

resource "aws_route_table_association" "terraform_public_subnet_association" {
  count                   = 2
  subnet_id      = aws_subnet.terraform_public_test_subnet.*.id[count.index]
  route_table_id = aws_route_table.terraform_public_rt.id
}

resource "aws_route_table_association" "terraform_private_subnet_association" {
  count                   = 2
  subnet_id      = aws_subnet.terraform_private_test_subnet.*.id[count.index]
  route_table_id = aws_default_route_table.terraform_private_rt.id
}