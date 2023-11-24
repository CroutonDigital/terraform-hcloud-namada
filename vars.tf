variable "hcloud_token" {
  sensitive = true
  description = "HETZNER API KEY"
}

# fsn1, hel1, ash or hil
# nbg1-dc3, fsn1-dc14, hel1-dc2, ash-dc1 or hil-dc1
variable "hetzner_location" {
  default = "fsn1"
  description = "HETZNER datacenter location"
}

variable "hetzner_datacenter" {
  default = "fsn1-dc14"
  description = "HETZNER datacenter"
}

variable "os_base_image" {
  default = "debian12"
  description = "Linux OS type"
}

variable "server_type" {
  default = "cpx11"
  description = "Hetzner VM type"
}

variable "service_name" {
  default = "namada-node"
  description = "Service name"
}

# Version docker containers
variable "app_version" {
  default = "testnet"
  description = "Docker app version"
}

variable "namada_chainid" {
  default = "testnet"
  description = "namada network mainnet / testnet / devnet "
}

variable "volume_size" {
  default = 10
  description = "Additional volume attached to VM for persistent data (configs, genesis, chain data)"
}
