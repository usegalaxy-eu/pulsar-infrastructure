variable "nfs_disk_size" {
  default = 200
}

variable "flavors" {
  type = map
  default = {
    "central-manager" = "medium"
    "nfs-server" = "medium"
    "exec-node" = "large"
    "gpu-node" = "large"
  }
}

variable "exec_node_count" {
  default = 2
}

variable "gpu_node_count" {
  default = 0
}

variable "image" {
  type = map
  default = {
    "name" = "vggp-v60-j326-d1dfcf46c4cd-main"
    "image_source_url" = "https://usegalaxy.eu/static/vgcn/vggp-v60-j326-d1dfcf46c4cd-main.raw"
    "container_format" = "bare"
    "disk_format" = "raw"
   }
}

variable "public_key" {
  type = map
  default = {
    name = "cloud_key"
    pubkey = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDy787GZIVdHW7QV+Wu2q9q5k5CiTOq04ENioVig88IIVGNqi8qiX+3fhZx/w2hhlz6AePrYu8CfVPplCRdSMjP46av53V1M7r0+yqJvuk1PC2f/rSoEL95TvaeiV28+5Wy4MC58UvYuewuhIHcbfPiXHf3NEE3scd38GXCYKLhAP28mUQ950Ar4SoWv4irv21maJwkwqn5AYXcy1yrbBZtaTbQELVPa/E6X9j+k29bn32ITmmtKBA3ne/QlFRaaYI3XggvMXhhSSIYsJUdlSOjUTriB2DraHsxMGfOPjmPXkjvrXp9MfOzjMg10fb7K2Mda8u/ujK/dvx3BnhlSIpn marco@marco-Latitude-3440"
  }
}

variable "name_prefix" {
  default = "vgcn-it02-"
}

variable "name_suffix" {
  default = ".pulsar"
}

variable "secgroups_cm" {
  type = list
  default = [
    "vgcn-it02-public-ssh",
    "vgcn-it02-ingress-private",
    "vgcn-it02-egress-public",
  ]
}

variable "secgroups" {
  type = list
  default = [
    "vgcn-it02-ingress-private",
    "vgcn-it02-egress-public",
  ]
}

variable "public_network" {
  default  = "public_net"
}

variable "private_network" {
  type = map
  default  = {
    name = "private_net"
    subnet_name = "private-subnet"
    cidr4 = "172.30.135.0/24"
  }
}

variable "ssh-port" {
  default = "22"
}
