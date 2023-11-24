resource "hcloud_primary_ip" "namada_primary_ip" {
  name          = "namada-${var.service_name}_primary_ip"
  datacenter    = var.hetzner_datacenter
  type          = "ipv4"
  assignee_type = "server"
  auto_delete   = false

}