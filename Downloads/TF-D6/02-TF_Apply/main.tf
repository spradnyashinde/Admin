// aws_vpc : https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc
// Argument Reference : https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc#argument-reference

resource "aws_vpc" "terraform_test_vpc" {
  # cidr_block           = 172.31.0.0/16
  cidr_block         = "172.31.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
 
  tags = {
    Name = "terraform_test_vpc"
  }
}

/*
$ terraform init

Initializing the backend...

Initializing provider plugins...
- Reusing previous version of hashicorp/aws from the dependency lock file
- Installing hashicorp/aws v4.37.0...
- Installed hashicorp/aws v4.37.0 (signed by HashiCorp)

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.

*/

/*
$ terraform plan

Terraform used the selected providers to generate the following execution
plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_vpc.terraform_test_vpc will be created
  + resource "aws_vpc" "terraform_test_vpc" {
      + arn                                  = (known after apply)
      + cidr_block                           = "172.31.0.0/16"
      + default_network_acl_id               = (known after apply)
      + default_route_table_id               = (known after apply)
      + default_security_group_id            = (known after apply)
      + dhcp_options_id                      = (known after apply)
      + enable_classiclink                   = (known after apply)
      + enable_classiclink_dns_support       = (known after apply)
      + enable_dns_hostnames                 = true
      + enable_dns_support                   = true
      + enable_network_address_usage_metrics = (known after apply)
      + id                                   = (known after apply)
      + instance_tenancy                     = "default"
      + ipv6_association_id                  = (known after apply)
      + ipv6_cidr_block                      = (known after apply)
      + ipv6_cidr_block_network_border_group = (known after apply)
      + main_route_table_id                  = (known after apply)
      + owner_id                             = (known after apply)
      + tags                                 = {
          + "Name" = "terraform_test_vpc"
        }
      + tags_all                             = {
          + "Name" = "terraform_test_vpc"
        }
    }

Plan: 1 to add, 0 to change, 0 to destroy.
*/

/*
$ terraform apply

Terraform used the selected providers to generate the following execution
plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_vpc.terraform_test_vpc will be created
  + resource "aws_vpc" "terraform_test_vpc" {
      + arn                                  = (known after apply)
      + cidr_block                           = "172.31.0.0/16"
      + default_network_acl_id               = (known after apply)
      + default_route_table_id               = (known after apply)
      + default_security_group_id            = (known after apply)
      + dhcp_options_id                      = (known after apply)
      + enable_classiclink                   = (known after apply)
      + enable_classiclink_dns_support       = (known after apply)
      + enable_dns_hostnames                 = true
      + enable_dns_support                   = true
      + enable_network_address_usage_metrics = (known after apply)
      + id                                   = (known after apply)
      + instance_tenancy                     = "default"
      + ipv6_association_id                  = (known after apply)
      + ipv6_cidr_block                      = (known after apply)
      + ipv6_cidr_block_network_border_group = (known after apply)
      + main_route_table_id                  = (known after apply)
      + owner_id                             = (known after apply)
      + tags                                 = {
          + "Name" = "terraform_test_vpc"
        }
      + tags_all                             = {
          + "Name" = "terraform_test_vpc"
        }
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_vpc.terraform_test_vpc: Creating...
aws_vpc.terraform_test_vpc: Still creating... [10s elapsed]
aws_vpc.terraform_test_vpc: Creation complete after 14s [id=vpc-0b1ae3cd8d51ff11c]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
*/

/*
cat terraform.tfstate
{
  "version": 4,
  "terraform_version": "1.3.1",
  "serial": 2,
  "lineage": "1bcb0e05-3a0c-7474-4ad1-1685aa26e064",
  "outputs": {},
  "resources": [
    {
      "mode": "managed",
      "type": "aws_vpc",
      "name": "terraform_test_vpc",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 1,
          "attributes": {
            "arn": "arn:aws:ec2:us-west-1:082923708139:vpc/vpc-0b1ae3cd8d51ff11c",
            "assign_generated_ipv6_cidr_block": false,
            "cidr_block": "172.31.0.0/16",
            "default_network_acl_id": "acl-0ff959824e5871660",
            "default_route_table_id": "rtb-0f32d09bc6eefb500",
            "default_security_group_id": "sg-05a9b93083dcab3ec",
            "dhcp_options_id": "dopt-4c4a1c2b",
            "enable_classiclink": false,
            "enable_classiclink_dns_support": false,
            "enable_dns_hostnames": true,
            "enable_dns_support": true,
            "enable_network_address_usage_metrics": false,
            "id": "vpc-0b1ae3cd8d51ff11c",
            "instance_tenancy": "default",
            "ipv4_ipam_pool_id": null,
            "ipv4_netmask_length": null,
            "ipv6_association_id": "",
            "ipv6_cidr_block": "",
            "ipv6_cidr_block_network_border_group": "",
            "ipv6_ipam_pool_id": "",
            "ipv6_netmask_length": 0,
            "main_route_table_id": "rtb-0f32d09bc6eefb500",
            "owner_id": "082923708139",
            "tags": {
              "Name": "terraform_test_vpc"
            },
            "tags_all": {
              "Name": "terraform_test_vpc"
            }
          },
          "sensitive_attributes": [],
          "private": "eyJzY2hlbWFfdmVyc2lvbiI6IjEifQ=="
        }
      ]
    }
  ],
  "check_results": []
}

terraform plan
aws_vpc.terraform_test_vpc: Refreshing state... [id=vpc-036e76418c44135c6]

No changes. Your infrastructure matches the configuration.

Terraform has compared your real infrastructure against your configuration and found no differences, so no changes are needed.
*/

/*
$ terraform state list
aws_vpc.terraform_test_vpc

terraform destroy --auto-approve
*/