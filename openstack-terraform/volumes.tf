resource "openstack_blockstorage_volume_v2" "irida_galaxy" {
  name = "irida_galaxy"
  size = "${var.volume_size}"
}

resource "openstack_compute_volume_attach_v2" "attached" {
  instance_id = "${openstack_compute_instance_v2.irida_galaxy.id}"
  volume_id   = "${openstack_blockstorage_volume_v2.irida_galaxy.id}"
  # Prevent re-creation: ignore changes to variables
  lifecycle {
    ignore_changes = ["volume_id", "instance_id"]
  }
}
