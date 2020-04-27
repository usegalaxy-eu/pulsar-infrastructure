resource "openstack_compute_instance_v2" "gpu-node-a" {

  count           = "${var.gpu_nodes_a["nodes_count"]}"
  name            = "${var.name_prefix}gpu-node-${count.index}${var.name_suffix}"
  flavor_name     = "${var.gpu_nodes_a["flavor_name"]}"
  image_id        = "${var.gpu_nodes_a["image_id"]}"
  key_pair        = "${openstack_compute_keypair_v2.my-cloud-key.name}"
  security_groups = "${var.secgroups}"

  network {
    uuid = "${data.openstack_networking_network_v2.internal.id}"
  }

  user_data = <<-EOF
    #cloud-config
    packages:
     - cuda-10-1
    write_files:
    - content: |
        CONDOR_HOST = ${openstack_compute_instance_v2.central-manager.network.1.fixed_ip_v4}
        ALLOW_WRITE = *
        ALLOW_READ = $(ALLOW_WRITE)
        ALLOW_ADMINISTRATOR = *
        ALLOW_NEGOTIATOR = $(ALLOW_ADMINISTRATOR)
        ALLOW_CONFIG = $(ALLOW_ADMINISTRATOR)
        ALLOW_DAEMON = $(ALLOW_ADMINISTRATOR)
        ALLOW_OWNER = $(ALLOW_ADMINISTRATOR)
        ALLOW_CLIENT = *
        DAEMON_LIST = MASTER, SCHEDD, STARTD
        FILESYSTEM_DOMAIN = vgcn
        UID_DOMAIN = vgcn
        TRUST_UID_DOMAIN = True
        SOFT_UID_DOMAIN = True
        # Advertise the GPUs
        use feature : GPUs
        GPU_DISCOVERY_EXTRA = -extra
        # run with partitionable slots
        CLAIM_PARTITIONABLE_LEFTOVERS = True
        NUM_SLOTS = 1
        NUM_SLOTS_TYPE_1 = 1
        SLOT_TYPE_1 = 100%
        SLOT_TYPE_1_PARTITIONABLE = True
        ALLOW_PSLOT_PREEMPTION = False
        STARTD.PROPORTIONAL_SWAP_ASSIGNMENT = True
      owner: root:root
      path: /etc/condor/condor_config.local
      permissions: '0644'
    - content: |
        /data           /etc/auto.data          nfsvers=3
      owner: root:root
      path: /etc/auto.master.d/data.autofs
      permissions: '0644'
    - content: |
        share  -rw,hard,intr,nosuid,quota  ${openstack_compute_instance_v2.nfs-server.access_ip_v4}:/data/share
      owner: root:root
      path: /etc/auto.data
      permissions: '0644'
  EOF
}

resource "openstack_blockstorage_volume_v2" "node-a-vol" {
  count = "${var.gpu_nodes_a["nodes_count"]}"
  name  = "${var.name_prefix}gpu-node-a${count.index}-vol"
  size  = "${var.gpu_nodes_a["disk_size"]}"
}

resource "openstack_compute_volume_attach_v2" "attached-node-a" {
  count       = "${var.gpu_nodes_a["nodes_count"]}"
  instance_id = "${element(openstack_compute_instance_v2.gpu-node-a.*.id, count.index)}"
  volume_id   = "${element(openstack_blockstorage_volume_v2.node-a-vol.*.id, count.index)}"
}

resource "openstack_compute_instance_v2" "gpu-node-b" {
  count           = "${var.gpu_nodes_b["nodes_count"]}"
  name            = "${var.name_prefix}gpu-node-b${count.index}${var.name_suffix}"
  flavor_name     = "${var.gpu_nodes_b["flavor_name"]}"
  image_id        = "${var.gpu_nodes_b["image_id"]}"
  key_pair        = "${openstack_compute_keypair_v2.my-cloud-key.name}"
  security_groups = "${var.secgroups}"

  network {
    uuid = "${data.openstack_networking_network_v2.internal.id}"
  }

  user_data = <<-EOF
    #cloud-config
    packages:
     - cuda-10-1
    write_files:
    - content: |
        CONDOR_HOST = ${openstack_compute_instance_v2.central-manager.network.1.fixed_ip_v4}
        ALLOW_WRITE = *
        ALLOW_READ = $(ALLOW_WRITE)
        ALLOW_ADMINISTRATOR = *
        ALLOW_NEGOTIATOR = $(ALLOW_ADMINISTRATOR)
        ALLOW_CONFIG = $(ALLOW_ADMINISTRATOR)
        ALLOW_DAEMON = $(ALLOW_ADMINISTRATOR)
        ALLOW_OWNER = $(ALLOW_ADMINISTRATOR)
        ALLOW_CLIENT = *
        DAEMON_LIST = MASTER, SCHEDD, STARTD
        FILESYSTEM_DOMAIN = vgcn
        UID_DOMAIN = vgcn
        TRUST_UID_DOMAIN = True
        SOFT_UID_DOMAIN = True
        # Advertise the GPUs
        use feature : GPUs
        GPU_DISCOVERY_EXTRA = -extra
        # run with partitionable slots
        CLAIM_PARTITIONABLE_LEFTOVERS = True
        NUM_SLOTS = 1
        NUM_SLOTS_TYPE_1 = 1
        SLOT_TYPE_1 = 100%
        SLOT_TYPE_1_PARTITIONABLE = True
        ALLOW_PSLOT_PREEMPTION = False
        STARTD.PROPORTIONAL_SWAP_ASSIGNMENT = True
      owner: root:root
      path: /etc/condor/condor_config.local
      permissions: '0644'
    - content: |
        /data           /etc/auto.data          nfsvers=3
      owner: root:root
      path: /etc/auto.master.d/data.autofs
      permissions: '0644'
    - content: |
        share  -rw,hard,intr,nosuid,quota  ${openstack_compute_instance_v2.nfs-server.access_ip_v4}:/data/share
      owner: root:root
      path: /etc/auto.data
      permissions: '0644'
  EOF
}

resource "openstack_blockstorage_volume_v2" "node-b-vol" {
  count = "${var.gpu_nodes_b["nodes_count"]}"
  name  = "${var.name_prefix}gpu-node-b${count.index}-vol"
  size  = "${var.gpu_nodes_b["disk_size"]}"
}

resource "openstack_compute_volume_attach_v2" "attached-node-b" {
  count       = "${var.gpu_nodes_b["nodes_count"]}"
  instance_id = "${element(openstack_compute_instance_v2.gpu-node-b.*.id, count.index)}"
  volume_id   = "${element(openstack_blockstorage_volume_v2.node-b-vol.*.id, count.index)}"
}

resource "openstack_compute_instance_v2" "gpu-node-c" {
  count           = "${var.gpu_nodes_c["nodes_count"]}"
  name            = "${var.name_prefix}gpu-node-c${count.index}${var.name_suffix}"
  flavor_name     = "${var.gpu_nodes_c["flavor_name"]}"
  image_id        = "${var.gpu_nodes_c["image_id"]}"
  key_pair        = "${openstack_compute_keypair_v2.my-cloud-key.name}"
  security_groups = "${var.secgroups}"

  network {
    uuid = "${data.openstack_networking_network_v2.internal.id}"
  }

  user_data = <<-EOF
    #cloud-config
    packages:
     - cuda-10-1
    write_files:
    - content: |
        CONDOR_HOST = ${openstack_compute_instance_v2.central-manager.network.1.fixed_ip_v4}
        ALLOW_WRITE = *
        ALLOW_READ = $(ALLOW_WRITE)
        ALLOW_ADMINISTRATOR = *
        ALLOW_NEGOTIATOR = $(ALLOW_ADMINISTRATOR)
        ALLOW_CONFIG = $(ALLOW_ADMINISTRATOR)
        ALLOW_DAEMON = $(ALLOW_ADMINISTRATOR)
        ALLOW_OWNER = $(ALLOW_ADMINISTRATOR)
        ALLOW_CLIENT = *
        DAEMON_LIST = MASTER, SCHEDD, STARTD
        FILESYSTEM_DOMAIN = vgcn
        UID_DOMAIN = vgcn
        TRUST_UID_DOMAIN = True
        SOFT_UID_DOMAIN = True
        # Advertise the GPUs
        use feature : GPUs
        GPU_DISCOVERY_EXTRA = -extra
        # run with partitionable slots
        CLAIM_PARTITIONABLE_LEFTOVERS = True
        NUM_SLOTS = 1
        NUM_SLOTS_TYPE_1 = 1
        SLOT_TYPE_1 = 100%
        SLOT_TYPE_1_PARTITIONABLE = True
        ALLOW_PSLOT_PREEMPTION = False
        STARTD.PROPORTIONAL_SWAP_ASSIGNMENT = True
      owner: root:root
      path: /etc/condor/condor_config.local
      permissions: '0644'
    - content: |
        /data           /etc/auto.data          nfsvers=3
      owner: root:root
      path: /etc/auto.master.d/data.autofs
      permissions: '0644'
    - content: |
        share  -rw,hard,intr,nosuid,quota  ${openstack_compute_instance_v2.nfs-server.access_ip_v4}:/data/share
      owner: root:root
      path: /etc/auto.data
      permissions: '0644'
  EOF
}

resource "openstack_blockstorage_volume_v2" "gpu-node-c-vol" {
  count = "${var.gpu_nodes_c["nodes_count"]}"
  name  = "${var.name_prefix}gpu-node-c${count.index}-vol"
  size  = "${var.gpu_nodes_c["disk_size"]}"
}

resource "openstack_compute_volume_attach_v2" "attached-gpu-node-c" {
  count       = "${var.gpu_nodes_c["nodes_count"]}"
  instance_id = "${element(openstack_compute_instance_v2.gpu-node-c.*.id, count.index)}" 
  volume_id   = "${element(openstack_blockstorage_volume_v2.gpu-node-c-vol.*.id, count.index)}"
}

resource "openstack_compute_instance_v2" "gpu-node-d" {
  count           = "${var.gpu_nodes_d["nodes_count"]}"
  name            = "${var.name_prefix}gpu-node-d${count.index}${var.name_suffix}"
  flavor_name     = "${var.gpu_nodes_d["flavor_name"]}"
  image_id        = "${var.gpu_nodes_d["image_id"]}"
  key_pair        = "${openstack_compute_keypair_v2.my-cloud-key.name}"
  security_groups = "${var.secgroups}"

  network {
    uuid = "${data.openstack_networking_network_v2.internal.id}"
  }

  user_data = <<-EOF
    #cloud-config
    packages:
     - cuda-10-1
    write_files:
    - content: |
        CONDOR_HOST = ${openstack_compute_instance_v2.central-manager.network.1.fixed_ip_v4}
        ALLOW_WRITE = *
        ALLOW_READ = $(ALLOW_WRITE)
        ALLOW_ADMINISTRATOR = *
        ALLOW_NEGOTIATOR = $(ALLOW_ADMINISTRATOR)
        ALLOW_CONFIG = $(ALLOW_ADMINISTRATOR)
        ALLOW_DAEMON = $(ALLOW_ADMINISTRATOR)
        ALLOW_OWNER = $(ALLOW_ADMINISTRATOR)
        ALLOW_CLIENT = *
        DAEMON_LIST = MASTER, SCHEDD, STARTD
        FILESYSTEM_DOMAIN = vgcn
        UID_DOMAIN = vgcn
        TRUST_UID_DOMAIN = True
        SOFT_UID_DOMAIN = True
        # Advertise the GPUs
        use feature : GPUs
        GPU_DISCOVERY_EXTRA = -extra
        # run with partitionable slots
        CLAIM_PARTITIONABLE_LEFTOVERS = True
        NUM_SLOTS = 1
        NUM_SLOTS_TYPE_1 = 1
        SLOT_TYPE_1 = 100%
        SLOT_TYPE_1_PARTITIONABLE = True
        ALLOW_PSLOT_PREEMPTION = False
        STARTD.PROPORTIONAL_SWAP_ASSIGNMENT = True
      owner: root:root
      path: /etc/condor/condor_config.local
      permissions: '0644'
    - content: |
        /data           /etc/auto.data          nfsvers=3
      owner: root:root
      path: /etc/auto.master.d/data.autofs
      permissions: '0644'
    - content: |
        share  -rw,hard,intr,nosuid,quota  ${openstack_compute_instance_v2.nfs-server.access_ip_v4}:/data/share
      owner: root:root
      path: /etc/auto.data
      permissions: '0644'
  EOF
}

resource "openstack_blockstorage_volume_v2" "gpu-node-d-vol" {
  name = "${var.name_prefix}gpu-node-d${count.index}-vol"
  size = "${var.gpu_nodes_d["disk_size"]}"
}

resource "openstack_compute_volume_attach_v2" "attached-node-d" {
  count = "${var.gpu_nodes_d["nodes_count"]}"
  instance_id = "${element(openstack_compute_instance_v2.gpu-node-d.*.id, count.index)}"
  volume_id   = "${openstack_blockstorage_volume_v2.gpu-node-d-vol.id}"
}
