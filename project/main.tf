# GitHub Provider Docs
# https://registry.terraform.io/providers/integrations/github/latest

terraform {
  required_providers {
    github = {
      source = "integrations/github"
      version = "6.9.0"
    }
  }
}

variable "github_token" {
  sensitive = true
}

provider "github" {
  token = var.github_token
}

resource "github_repository" "remote" {
  name = "2026-01-iac-hetzner"
}

output "remote_repo" {
  value = github_repository.remote.http_clone_url
}

resource "github_repository_collaborators" "students" {
  repository = github_repository.remote.name

  user {
    username = "AndreasGio092025"
  }

  user {
    username = "desiree25sfj"
  }

  user {
    username = "brage092025"
  }

  user {
    username = "dainius092025"
  }

  user {
    username = "Andreas092025"
  }

  user {
    username = "Daniel092025"
  }

  user {
    username = "wolfgang25sfj"
  }

  user {
    username = "sindre092025"
  }

  user {
    username = "wc082025-cyber "
  }

  user {
    username = "jarand220925"
  }
}