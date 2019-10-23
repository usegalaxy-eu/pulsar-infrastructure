variable "nfs_disk_size" {
  default = 300
}

variable "flavors" {
  type = "map"
  default = {
    "central-manager" = "large"
    "nfs-server" = "large"
    "exec-node" = "xxlarge"
    "gpu-node" = "large"
  }
}

variable "exec_node_count" {
  default = 6
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
    name = "cloud2"
    pubkey = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDV7gfNbNN5O8vH6/tM/iOFXKBP2YKRHXOmdfV8ogvu9BdVV0IPmDzk2EooVpThDE1VMv1hz3811tvBhHRJ6IgNhVIV/61w/+RazQD/AU27X8bX+Hb9EQ/bP4DW+6ySd/z5vdDLzpH5dbiMhzPEDkXVsylUT+hkQnas6cHspDhHmtKQ5MWOgDe3D/IEudTDJQe8hxxaU4TaZUmFzn7eYp9HvuK8qW0yCy4NWOxJJHA+G5wSCyLuKnaKo4AitUIzSKF1AB94oq7b96KONhPxgRptAk4OYIUTdNFbrI5HDaSNzHLnF5FbjQvG+Eu6m5nY5yvJMogE+jiuWeIXCZTCFljg287FUo0ohmbZpd802L6VXun14VumRC+rRgPrvBALo/CsyCsPIoBSTKhVElxKVOcRjmTLNfrUZM0GQxqJhIvah8BV+JTExkipPwkrKTdMAWIXvCoehxV+WMpBWqtEEzAzEoqJpaiec7HfriwsHTGESZWAPYEbFjzbHXQZtqBkbOvtokPMRmTWfWKxaplCMN6ddJeeY6faorD0w/e6lszWES1Q1ieajiPKDy37UvybKKvPTk4o3MzyzYOS4c8HQj+jnGeR5Q3ETuyz4psLyOfuBtIrfOeuxV42rFDmkYM3IrrRR+F9oklFG6Ig8DVfgQEzSG36NkgvpF4OdFvigYqXvw== cloud@vgcn"
  }
}

variable "name_prefix" {
  default = "vgcn-it01-"
}

variable "name_suffix" {
  default = ".pulsar"
}

variable "secgroups_cm" {
  type = "list"
  default = [
    "vgcn-it01-public-ssh",
    "vgcn-it01-ingress-private",
    "vgcn-it01-egress-public",
  ]
}

variable "secgroups" {
  type = "list"
  default = [
    "vgcn-it01-ingress-private",
    "vgcn-it01-egress-public",
  ]
}

variable "public_network" {
  default  = "public_net"
}

variable "private_network" {
  type = "map"
  default  = {
    name = "private_net"
    subnet_name = "private_subnet"
    cidr4 = "172.30.63.0/24"
  }
}

variable "ssh-port" {
  default = "22"
}
