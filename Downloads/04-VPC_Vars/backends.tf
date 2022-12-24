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
    organization = "ORGNAME"

    workspaces {
      name = "test_tf_workspace"
    }
  }
}