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
