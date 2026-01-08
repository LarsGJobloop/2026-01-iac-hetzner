variable "ssh_key" {
  type = string
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

  user_data = file("${path.module}/cloud-init.yaml")
}

output "ip_address" {
  value = hcloud_server.example_server.ipv4_address
}
