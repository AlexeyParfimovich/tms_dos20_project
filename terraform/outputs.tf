output "vm_info" {
  description = "General information about created VMs"
  value = [
    for vm in libvirt_domain.tms : {
      id = vm.name
      ip = vm.network_interface[0].addresses.0
      mac = vm.network_interface[0].mac
    }
  ]
}
