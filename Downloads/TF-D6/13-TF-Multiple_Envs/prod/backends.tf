/*
terraform {
  backend "remote" {
    organization = "org-name-here"

    workspaces {
      name = "workspace-name-here"
    }
  }
}
*/

terraform {
  cloud {
    organization = "cloudmldevops"

    workspaces {
      name = "prod_tf_resources_ws"
    }
  }
}