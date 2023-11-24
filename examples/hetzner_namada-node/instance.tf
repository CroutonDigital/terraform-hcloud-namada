variable "hcloud_token" {
  sensitive = true
  default   = ""
}

module "namada-node" {
  source          = "../../"
#  source         = "CroutonDigital/namada/hcloud"
#  version        = "0.0.6" # Set last module version

  hcloud_token   = var.hcloud_token
  service_name   = "namada-node"
  server_type    = "cpx11"
  os_base_image  = "debian-12"
  volume_size    = 30
  # mainnet / testnet / devnet Used for download genesis and docker image
  namada_chainid    = "public-testnet-14.5d79b6958580"
  app_version    = "namada-v0.23.1"
}

output "node_host_ip" {
  value = module.namada-node.node_host_ip
}