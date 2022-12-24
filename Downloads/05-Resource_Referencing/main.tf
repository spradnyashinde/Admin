// https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc
// https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet

resource "aws_vpc" "terraform_test_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "terraform_test_vpc"
  }
}

// Here this IGW resource will be created in the VPC created in this file itself.
resource "aws_internet_gateway" "terraform_test_internet_gateway" {
  vpc_id = aws_vpc.terraform_test_vpc.id

  tags = {
    Name = "terraform_test_internet_gateway"
  }
}