terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "1.58.0"
    }
  }
}

variable "hcloud_token" {
  sensitive = true
}

provider "hcloud" {
  token = var.hcloud_token
}

module "compose_app" {
  source = "./hetzner-compose-app"

  ssh_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIA5CCPkPieku3gNLy/a91f0CB0saFxzJd3C+0+GRUjq0 admin"
}

output "ip_address" {
  value = module.compose_app.ip_address
}
