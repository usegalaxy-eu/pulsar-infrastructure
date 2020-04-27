variable "nfs_disk_size" {
  default = 400
}

variable "flavors" {
  type = "map"
  default = {
    "central-manager" = "m1.medium"
    "nfs-server" = "m1.medium"
    "exec-node" = "m1.medium"
    "gpu-node" = "g1.gput4_g1c8m20"
  }
}

variable "exec_node_count" {
  default = 0
}

variable "gpu_node_count" {
  default = 8
}

variable "gpu_nodes_a" {
  type = "map"
  default = {
    nodes_count = 8
    flavor_name = "g1.gput4_g1c8m20"
    image_name = "vggp-v31-j138-29cbb3fcb2cf-master"
    image_id = "413fa1a9-37cf-433e-9604-4733caf8d035"
    disk_size = 500
  }
}

variable "gpu_nodes_b" {
  type = "map"
  default = {
    nodes_count = 7
    flavor_name = "g1.n46_g1c8m20"
    image_name = "vggp-v31-j138-29cbb3fcb2cf-master"
    image_id = "413fa1a9-37cf-433e-9604-4733caf8d035"
    disk_size = 500
  }
}

variable "gpu_nodes_c" {
  type = "map"
  default = {
    nodes_count = 2
    flavor_name = "g1.n46_g1c8m20_2"
    image_name = "vggp-v31-j138-29cbb3fcb2cf-master"
    image_id = "413fa1a9-37cf-433e-9604-4733caf8d035"
    disk_size = 500
  }
}

variable "gpu_nodes_d" {
  type = "map"
  default = {
    nodes_count = 1
    flavor_name = "g1.n36_g1c40m115"
    image_name = "vggp-v31-j138-29cbb3fcb2cf-master"
    image_id = "413fa1a9-37cf-433e-9604-4733caf8d035"
    disk_size = 500
  }
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
    name = "cloud2"
    pubkey = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDV7gfNbNN5O8vH6/tM/iOFXKBP2YKRHXOmdfV8ogvu9BdVV0IPmDzk2EooVpThDE1VMv1hz3811tvBhHRJ6IgNhVIV/61w/+RazQD/AU27X8bX+Hb9EQ/bP4DW+6ySd/z5vdDLzpH5dbiMhzPEDkXVsylUT+hkQnas6cHspDhHmtKQ5MWOgDe3D/IEudTDJQe8hxxaU4TaZUmFzn7eYp9HvuK8qW0yCy4NWOxJJHA+G5wSCyLuKnaKo4AitUIzSKF1AB94oq7b96KONhPxgRptAk4OYIUTdNFbrI5HDaSNzHLnF5FbjQvG+Eu6m5nY5yvJMogE+jiuWeIXCZTCFljg287FUo0ohmbZpd802L6VXun14VumRC+rRgPrvBALo/CsyCsPIoBSTKhVElxKVOcRjmTLNfrUZM0GQxqJhIvah8BV+JTExkipPwkrKTdMAWIXvCoehxV+WMpBWqtEEzAzEoqJpaiec7HfriwsHTGESZWAPYEbFjzbHXQZtqBkbOvtokPMRmTWfWKxaplCMN6ddJeeY6faorD0w/e6lszWES1Q1ieajiPKDy37UvybKKvPTk4o3MzyzYOS4c8HQj+jnGeR5Q3ETuyz4psLyOfuBtIrfOeuxV42rFDmkYM3IrrRR+F9oklFG6Ig8DVfgQEzSG36NkgvpF4OdFvigYqXvw== cloud@vgcn"
  }
}

variable "name_prefix" {
  default = "vgcn-de03-"
}

variable "name_suffix" {
  default = ".pulsar"
}

variable "secgroups_cm" {
  type = "list"
  default = [
    "vgcn-de03-public-ssh",
    "vgcn-de03-ingress-private",
    "vgcn-de03-egress-public",
  ]
}

variable "secgroups" {
  type = "list"
  default = [
    "vgcn-de03-ingress-private",
    "vgcn-de03-egress-public",
  ]
}

variable "public_network" {
  default  = "public"
}

variable "private_network" {
  type = "map"
  default  = {
    name = "vgcn-de03-private"
    subnet_name = "vgcn-de03-private-subnet"
    cidr4 = "192.168.195.0/24"
  }
}

variable "ssh-port" {
  default = "22"
}
