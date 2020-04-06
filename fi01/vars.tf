variable "nfs_disk_size" {
  default = 300
}

variable "flavors" {
  type = "map"
  default = {
    "central-manager" = "standard.medium"
    "nfs-server" = "standard.medium"
    "exec-node" = "standard.xxlarge"
    "gpu-node" = "gpu.1.4gpu"
  }
}

variable "exec_node_count" {
  default = 3
}

variable "gpu_node_count" {
  default = 0
}

variable "image" {
  type = "map"
  default = {
    "name" = "vggp-v31-j132-4ab83d5ffde9-master"
    "image_source_url" = "https://usegalaxy.eu/static/vgcn/vggp-v31-j132-4ab83d5ffde9-master.raw"
    "container_format" = "bare"
    "disk_format" = "raw"
   }
}

variable "public_key" {
  type = "map"
  default = {
    name = "key_label"
    pubkey = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCVmFc0fiB+sPM2FuIcGVUEzbmLb8+0tFbFz9WsEr4mwUA0eH5+KAJ7EXv3ifcf25eAwLEMXaOMbdVP0dQ5Lsh8b+pH2yu40aVhkTT57UrcH1q3c7arbE2C8Z65+jCDRWbAR24wXSyKvKM7BQG6hxIL2Ql8mtLtsT0D2S0TkXeRHseJgdzN1uP/tKIk+NV6TA4vsIwHVrJ84MJAPkuix13T+KV3g/p3cihgKB/FW4BN1DPSKzN7nDV4zYBcX6jB3mGTX2EIM2E2mDM6I+dMQDeIAga0j9T6bLnUYFpCpId6Emfo+bwyaUC53De7X4AH9fDa5tjXjZ8QeulzyV/l+zZt cloud-user@pulsar-bastion.novalocal"
  }
}

variable "name_prefix" {
  default = "vgcn-"
}

variable "name_suffix" {
  default = ".usegalaxy.eu"
}

variable "secgroups_cm" {
  type = "list"
  default = [
    "vgcn-public-ssh",
    "vgcn-ingress-private",
    "vgcn-egress-public",
  ]
}

variable "secgroups" {
  type = "list"
  default = [
    "vgcn-ingress-private",
    "vgcn-egress-public",
  ]
}

variable "public_network" {
  default  = "public"
}

variable "private_network" {
  type = "map"
  default  = {
    name = "project_2002859"
    subnet_name = "project_2002859"
    cidr4 = "192.168.1.0/24"
  }
}

variable "ssh-port" {
  default = "22"
}
