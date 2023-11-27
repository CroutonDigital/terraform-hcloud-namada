# terraform-hetzner-namada
Deploy namada node on Hetzner


## Requirements to configure a namada integration
The requirements to configure a namada integration include:

* A namada Full node. You can operate your own namada Full node or use a Full node from a node operator.
* Suggested hardware requirements to run a namada Full node:
   * CPU: 8 physical cores / 16 vCPUs
   * RAM: 128 GB
   * Storage (SSD): 4 TB NVMe drive

For best results, run namada Full nodes on Linux. namada supports the Ubuntu and Debian distributions. You can also fun a Full node on macOS.

## Deploy namada-NODE

### Create project on hetzner
* Go to https://console.hetzner.cloud/
* Press + New project and enter name of project 
* Go to created project and Security 
* Press add SSH key and upload your admin ssh public key with name "admin ssh key"
* Go to API Tab and Create API Tokens

### Prepare terraform directory structure and deploy 

Example files you can take: 
```bash
git clone https://github.com/CroutonDigital/terraform-hcloud-namada.git
cd terraform-hetzner-namada/examples/hetzner_namada-node
```

Example how to use module: 
```yaml
variable "hcloud_token" {
  sensitive = true
  default   = ""
}

module "namada" {
  source         = "CroutonDigital/namada/hcloud"
  version        = "0.0.2" # Set last module version 
  hcloud_token   = var.hcloud_token
  service_name   = "namada-node"
  server_type    = "cpx11"
  os_base_image  = "debian-12"
  volume_size    = 500
  # mainnet / testnet / devnet Used for download genesis and docker image
  namada_chainid    = "public-testnet-14.5d79b6958580"
  app_version    = "namada-v0.23.1"
}
```

```bash
export TF_VAR_hcloud_token="PUT HEZTNER API TOKEN"

$ terraform init
$ terraform plan
$ terraform apply

# Print namada-NODE ip
$ terraform output 
```

Run `terraform destroy` when you don't need these resources.

### Login to namada-NODE inside VM

```bash
ssh root@<namada node ip>
```

### Configuration and Installation

https://docs.namada.net/operators/ledger/env-vars