# module "k8s-rig" {
#   source    = "./modules/k8s-node/"
  
#   qemu_host      = "qemu:///system"
#   qemu_datastore = "FD-SSD"

#   vm_name   = "k8s-rig"
#   mem_gb    = 8
#   num_cpu   = 4
#   autostart = true

#   net_interface = "br0"
#   ip_address   = "192.168.167.17"

#   os_size_gb   = 20
#   data_size_gb = 60
# }