# home-ops
Home k8s cluster operations / setup

# Overview
Ansible playbooks and general information for maintaining home kubernetes infrastructure. This repo builds the base infrastructure for hosting my GitOps based k8s cluster [here](https://github.com/mitsumaui/home-gitops).

# Hardware
All Kubernetes machines are running Ubuntu 20.04

| Name    | Device  | Disks                                     | CPU                      | Memory | Role             |
|---------|---------|-------------------------------------------|--------------------------|--------|------------------|
| k8s-esx | ESXi VM | 20GB OS-SSD 80GB Data-SSD                 | 4 x i5-3470 3.20Ghz      | 4GB    | k3s-multi-master |
| k8s-rig | QEMU VM | 20GB OS-SSD 80GB Data-SSD                 | 4 x Ryzen 1600AF 3.20Ghz | 4GB    | k3s-multi-master |
| k8s-nuc | NUC8i5  | 256GB NVMe - 40GB OS-SSD - 200GB Data-SSD | 8 x i5-8259U 2.30Ghz     | 16GB   | k3s-multi-master |

# Thanks
A large portion of this codebase originated from [onedr0p](https://github.com/onedr0p) - with huge thanks to him for his mastery in Ansible and Kubernetes! 

If you are interested in learning more or join a community of folk running k8s at home - this [discord](https://discord.gg/DNCynrJ) group is awesome!