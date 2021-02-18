# home-ops
Home k8s cluster operations / setup

# Overview
Ansible playbooks and general information for maintaining home kubernetes infrastructure. 

# Hardware
All kubernetes machines are running Ubuntu 20.04

| Name    | Device  | Disks                                     | CPU                      | Memory | Role             |
|---------|---------|-------------------------------------------|--------------------------|--------|------------------|
| k8s-esx | ESXi VM | 20GB OS-SSD 80GB Data-SSD                 | 4 x i5-3470 3.20Ghz      | 4GB    | k3s-multi-master |
| k8s-rig | QEMU VM | 20GB OS-SSD 80GB Data-SSD                 | 4 x Ryzen 1600AF 3.20Ghz | 4GB    | k3s-multi-master |
| k8s-nuc | NUC8i5  | 256GB NVMe - 40GB OS-SSD - 200GB Data-SSD | 8 x i5-8259U 2.30Ghz     | 16GB   | k3s-multi-master |