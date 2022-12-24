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
      name = "qa_tf_resources_ws"
    }
  }
}