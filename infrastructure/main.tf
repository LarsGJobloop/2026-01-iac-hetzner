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

resource "hcloud_ssh_key" "example_ssh_key" {
  name       = "example-key"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIA5CCPkPieku3gNLy/a91f0CB0saFxzJd3C+0+GRUjq0 admin"
}

resource "hcloud_server" "example_server" {
  name = "example-server"

  server_type = "cax41"
  image       = "debian-13"
  location    = "hel1" # Helsinki

  ssh_keys = [
    hcloud_ssh_key.example_ssh_key.id
  ]
}

output "server_ipv4" {
  value = hcloud_server.example_server.ipv4_address
}
