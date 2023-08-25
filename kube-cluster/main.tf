provider "vsphere" {
  user           = var.vsphere_user
  password       = var.vsphere_password
  vsphere_server = var.vsphere_server

  allow_unverified_ssl = true
}

data "vsphere_datacenter" "datacenter" {
  name = var.vsphere_datacenter
}

data "vsphere_compute_cluster" "cluster" {
  name = var.vsphere_cluster
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_datastore" "datastore" {
  name = var.vsphere_datastore
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

# data "vsphere_distributed_virtual_switch" "vdswitch" {
#  name = "Non-Prod vDSwitch"
#  datacenter_id = data.vsphere_datacenter.datacenter.id
#}

data "vsphere_network" "network" {
  name = var.vsphere_network
  #distributed_virtual_switch_uuid = data.vsphere_distributed_virtual_switch.vdswitch.id
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_virtual_machine" "template" {
  name = "${var.vsphere_template_folder}/${var.vsphere_template_name}"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

resource "vsphere_virtual_machine" "kubecluster" {
  for_each = var.vm_kubecluster_map

  name = each.key
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id = data.vsphere_datastore.datastore.id

  folder = var.vsphere_folder

  num_cpus = var.vm_num_cpus
  cpu_hot_add_enabled = var.vm_cpu_hot_add_enabled
  memory = var.vm_memory
  memory_hot_add_enabled = var.vm_memory_hot_add_enabled

  guest_id = data.vsphere_virtual_machine.template.guest_id
  scsi_type = data.vsphere_virtual_machine.template.scsi_type
  firmware = data.vsphere_virtual_machine.template.firmware
  wait_for_guest_net_timeout = 0

  network_interface {
    network_id = data.vsphere_network.network.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }

  disk {
    label = "disk0"
    size  = data.vsphere_virtual_machine.template.disks.0.size
    eagerly_scrub = data.vsphere_virtual_machine.template.disks.0.eagerly_scrub
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
  }

  cdrom {
    client_device = true
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
    customize {
      linux_options {
        host_name = each.key
        domain = var.vm_domain
      }
      network_interface {
        ipv4_address = each.value
        ipv4_netmask = var.vm_ipv4_netmask
      }
      ipv4_gateway = var.vm_ipv4_gateway
      dns_server_list = [ var.vm_dns_server_1, var.vm_dns_server_2, var.vm_dns_server_3 ]
      dns_suffix_list = [ var.vm_dns_suffix_1 ]
    }
  }
  
  lifecycle {
    ignore_changes = [
      clone[0].template_uuid,
    ]
  }

  connection {
    type = "ssh"
    user = var.vm_provisioner_username
    password = var.vm_provisioner_password
    host = each.value
  }

  provisioner "file" {
    source      = "./scripts"
    destination = "/tmp"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod -R +x /tmp/scripts/",
      "/tmp/scripts/reset-machine-id.sh",
      "/tmp/scripts/create-local-user.sh",
      "sudo rm -rf /tmp/scripts"
    ]
    
  }
}
