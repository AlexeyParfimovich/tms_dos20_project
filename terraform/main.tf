# Create the VM pool
resource "libvirt_pool" "pool" {
  type = "dir"
  name = "${local.prefix}-pool"
  path = "${local.pool.path}/${local.prefix}-pool"
}

# Get the ubuntu release image
resource "libvirt_volume" "image" {
  name = "ubuntu image"
  pool = libvirt_pool.pool.name
  format = "${local.pool.img_format}"
  source = "${path.module}${local.pool.img_source}"
}

# Configure the VM images
resource "libvirt_volume" "root" {
  count = length(local.vms)
  name = "${local.prefix}-${local.vms[count.index].name}.qcow2"
  pool = libvirt_pool.pool.name
  size = local.vms[count.index].vl_size
  base_volume_id = libvirt_volume.image.id
}

# Use CloudInit to add host name, user, ssh-key to the vm instance
# for more info check this out
# https://github.com/dmacvicar/terraform-provider-libvirt/blob/master/website/docs/r/cloudinit.html.markdown
resource "libvirt_cloudinit_disk" "commoninit" {
  count = length(local.vms)
  pool = libvirt_pool.pool.name
  name = "commoninit-${local.prefix}-${local.vms[count.index].name}.iso"
  user_data = templatefile("${path.module}/templates/user_data.tpl", {
      host_name = "${local.prefix}-${local.vms[count.index].name}"
      auth_key  = file("~/.ssh/id_rsa.pub")
  })
}

# Create the VMs
resource "libvirt_domain" "tms" {
  count = length(local.vms)

  name   = "${local.prefix}-${local.vms[count.index].name}"
  vcpu   = local.vms[count.index].cpu_cores
  memory = local.vms[count.index].mem_size

  cloudinit = element(libvirt_cloudinit_disk.commoninit.*.id, count.index)

  disk {
    volume_id = element(libvirt_volume.root.*.id, count.index)
  }

  network_interface {
    network_name = "default"
    wait_for_lease = true
    mac = local.vms[count.index].mac
  }
  
  # IMPORTANT: this is a known bug on cloud images, since they expect a console
  # we need to pass it https://bugs.launchpad.net/cloud-images/+bug/1573095
  console {
    type        = "pty"
    target_port = "0"
    target_type = "serial"
  }

  console {
    type        = "pty"
    target_type = "virtio"
    target_port = "1"
  }

  graphics {
    type        = "spice"
    listen_type = "address"
    autoport    = true
  }
}

# generate inventory file for Ansible
resource "local_file" "hosts_cfg" {
  content = templatefile("${path.module}/templates/hosts.tpl",
    {
      tms_appsrvs = [
        for vm in [libvirt_domain.tms[0],libvirt_domain.tms[1]]  : {
          id = vm.name
          ip = vm.network_interface[0].addresses.0
        }
      ]

      tms_gatesrvs = [
        for vm in [libvirt_domain.tms[2],libvirt_domain.tms[3]]  : {
          id = vm.name
          ip = vm.network_interface[0].addresses.0
        }
      ]
    }
  )
  filename = "../.artifacts/ansible/hosts"
}
