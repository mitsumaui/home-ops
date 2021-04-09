module "netboot" {
  source    = "./modules/k8s-node/"
  
  qemu_host      = "qemu:///system"
  qemu_datastore = "FD-SSD"

  vm_name   = "netboot"
  mem_gb    = 6
  num_cpu   = 4
  autostart = true

  net_interface = "br0"
  ip_address   = "192.168.167.240"

  os_size_gb   = 20
  data_size_gb = 5
}
