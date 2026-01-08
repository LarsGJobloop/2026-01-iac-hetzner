# GitHub Provider Docs
# https://registry.terraform.io/providers/integrations/github/latest

terraform {
  required_providers {
    github = {
      source  = "integrations/github"
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
  name       = "2026-01-iac-hetzner"
  visibility = "public"
}

output "remote_repo" {
  value = github_repository.remote.http_clone_url
}

# Locals are a way to define terraform variables
locals {
  students = [
    "AndreasGio092025",
    "desiree25sfj",
    "brage092025",
    "dainius092025",
    "Andreas092025",
    "Daniel092025",
    "wolfgang25sfj",
    "sindre092025-eng",
    "wc082025-cyber",
    "jarand220925",
    "IvanKalyta2025",
  ]
}

resource "github_repository_collaborator" "admins" {
  # for_each is HashiCorp Configuration Language's (HCL) "hacky" variation of a loop
  for_each = toset(local.students)

  repository = github_repository.remote.name
  username   = each.value
  permission = "admin"
}
