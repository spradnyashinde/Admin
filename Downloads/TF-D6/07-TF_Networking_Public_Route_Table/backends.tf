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
    organization = "ORG-NAME"

    workspaces {
      name = "test_tf_workspace"
    }
  }
}