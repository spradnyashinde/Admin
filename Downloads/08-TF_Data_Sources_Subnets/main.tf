# https://developer.hashicorp.com/terraform/language/data-sources
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zone
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
  vpc_id                  = aws_vpc.terraform_test_vpc.id
  cidr_block              = var.public_cidr
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "terraform_public_test_subnet"
  }
}

resource "aws_subnet" "terraform_private_test_subnet" {
  vpc_id     = aws_vpc.terraform_test_vpc.id
  cidr_block = var.private_cidr
  map_public_ip_on_launch = false
  availability_zone       = data.aws_availability_zones.available.names[1]
  tags = {
    Name = "terraform_private_test_subnet"
  }
}