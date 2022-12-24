# https://developer.hashicorp.com/terraform/language/values/variables

variable "vpc_cidr" {
  type    = string
  description = "Enter the VPC CIDR Value."
  /default = "172.31.0.0/16"
}

variable "vpc_tag_name" {
  type    = string
  description = "Enter the VPC Tag Value"
}