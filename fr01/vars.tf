variable "nfs_disk_size" {
  default = 300
}

variable "flavors" {
  type = "map"
  default = {
    "central-manager" = "m1.large"
    "nfs-server" = "m1.large"
    "exec-node" = "m1.2xlarge"
    "gpu-node" = "m1.2xlarge"
  }
}

variable "exec_node_count" {
  default = 2
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
    pubkey = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDfd6JxQqokL0x/l95VRxL74Vm0obxOU6poAyg7+To4lB3pcKOfXGknl6zvPevgSegi3qtkwtzRZT8DNaHQpjUqrRcFVMx4Ec1y+QOV5L3kGgdIVZFILKctY/ynEiyvGeEtJfcFziUlqNWcVnBFqZ5WBHGiP1EHhS6KYOG7abifdryS/JBUe/S3ILMJLeIuJx3CTcvEgnt7wVMmGd9uhkr7UJQAdgKRthTn7LweVqtBMOpd7gbdZg4TjchFjCBvcI3ljY/lIFeovBzYqbHsIUnG+LSBzrZI8EDOVEDPpyeCiSAHmg/op/M093tUQkTDCQ4KKcxOymH2VBa9EzHUxXHQwrP73VGouuT/o4Ige9+yMWEZd26IrdcANfkqAiYO/NPfoTojZ8aak345M+mWMvTT48LkOA5eWZzcjPWjAS1xWqAE+k7kOdsSi+uQyyOqt/7SQe7+8CzfUNlbr+sSuy2OzTVVgSRphwsk+d8QnFPRa8vxNgBmS/VZlEuFTgz7Xhfg+JeuV791dl2tiRU4jIipjoqqyqG2RVbBCuSoEC9QcWZ2oZZWsa4SMPsPMevuA/kkoy5mXivbnTP+oNXIFKKUerAne4pVwF0kyDoZGpRHxgcM0ZpqBJWFJVpgOe4X+zcpjckh/23t3Z2UCEMh2CE9A/c1rGTjKAGqFTmYbu4L6Q== cloud@vgcn"
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
  default  = "provider"
}

variable "private_network" {
  type = "map"
  default  = {
    name = "provider"
    subnet_name = "provider"
    cidr4 = "192.168.100.0/23"
  }
}

variable "ssh-port" {
  default = "22"
}
