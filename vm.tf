resource "hcloud_server" "namada" {
  name          = "namada-${var.service_name}"
  image         = var.os_base_image
  server_type   = var.server_type
  datacenter    = var.hetzner_datacenter
  ssh_keys      = [ data.hcloud_ssh_key.admin_ssh_key.id ]
  firewall_ids  = [ hcloud_firewall.namada.id ]
  user_data     = templatefile("${path.module}/cloud_init.yml.tftpl", {
    opt                 = hcloud_volume.namada.linux_device
    version             = var.app_version
    namada_chainid         = var.namada_chainid
  })

  public_net {
    ipv4_enabled = false
    ipv4 = hcloud_primary_ip.namada_primary_ip.id
    ipv6_enabled = false
  }

}

resource "hcloud_volume_attachment" "opt" {
  volume_id = hcloud_volume.namada.id

  server_id = hcloud_server.namada.id
  automount = false
}
