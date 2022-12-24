// https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc

resource "aws_vpc" "terraform_test_vpc" {
  cidr_block           = "172.31.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "terraform_test_vpc"
  }
}

/*
modify enable_dns_hostnames to false
terraform plan

[ec2-user@ip-172-31-0-125 terraform_scripts]$ terraform plan
aws_vpc.terraform_test_vpc: Refreshing state... [id=vpc-02ec1aee1cb03dfd1]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  ~ update in-place

Terraform will perform the following actions:

  # aws_vpc.terraform_test_vpc will be updated in-place
  ~ resource "aws_vpc" "terraform_test_vpc" {
      ~ enable_dns_hostnames                 = true -> false
        id                                   = "vpc-02ec1aee1cb03dfd1"
        tags                                 = {
            "Name" = "terraform_test_vpc"
        }
        # (16 unchanged attributes hidden)
    }

Plan: 0 to add, 1 to change, 0 to destroy.

[ec2-user@ip-172-31-0-125 terraform_scripts]$ terraform apply
aws_vpc.terraform_test_vpc: Refreshing state... [id=vpc-02ec1aee1cb03dfd1]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  ~ update in-place

Terraform will perform the following actions:

  # aws_vpc.terraform_test_vpc will be updated in-place
  ~ resource "aws_vpc" "terraform_test_vpc" {
      ~ enable_dns_hostnames                 = true -> false
        id                                   = "vpc-02ec1aee1cb03dfd1"
        tags                                 = {
            "Name" = "terraform_test_vpc"
        }
        # (16 unchanged attributes hidden)
    }

Plan: 0 to add, 1 to change, 0 to destroy.

Do you want to perform these actions in workspace "new_test_tf_wf_today"?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_vpc.terraform_test_vpc: Modifying... [id=vpc-02ec1aee1cb03dfd1]
aws_vpc.terraform_test_vpc: Still modifying... [id=vpc-02ec1aee1cb03dfd1, 10s elapsed]
aws_vpc.terraform_test_vpc: Modifications complete after 13s [id=vpc-02ec1aee1cb03dfd1]

Apply complete! Resources: 0 added, 1 changed, 0 destroyed.

*/