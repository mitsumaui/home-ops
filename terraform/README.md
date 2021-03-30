# Terraform

I have 2 x QEMU hypervisors which run some of my k8s nodes. These k8s VMs are defined by terraform to ensure a consistent and stateful build. 

Each "VM" is built on a module in the [modules](https://github.com/mitsumaui/home-ops/tree/main/terraform/modules/k8s-node) directory. 