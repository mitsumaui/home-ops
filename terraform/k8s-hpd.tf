module "k8s-hpd" {
  source    = "./modules/k8s-node/"
  
  qemu_host      = "qemu+ssh://jason@192.168.167.8/system"
  qemu_datastore = "Data"

  vm_name   = "k8s-hpd"
  mem_gb    = 12
  num_cpu   = 4
  autostart = true

  net_interface = "br0"
  ip_address   = "192.168.167.14"

  os_size_gb   = 20
  data_size_gb = 60
}