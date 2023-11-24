resource "hcloud_volume" "namada" {
  name      = "namada-${var.service_name}-root"
  location = var.hetzner_location
  size      = var.volume_size
  automount = false
  format    = "xfs"
  #  mount_point = "/opt"
  labels = {
    VM = "${var.service_name}"
    Service = "namada-NODE"
  }

#  lifecycle {
#    prevent_destroy = true
#  }
}
