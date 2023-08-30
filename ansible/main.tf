provider "vsphere" {
  user           = var.vsphere_svc_user_name
  password       = var.vsphere_svc_user_password
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

resource "vsphere_virtual_machine" "servers" {
  for_each = { for vm in var.vm_list: vm.name => vm } 

  name = each.value.name
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id = data.vsphere_datastore.datastore.id

  folder = var.vsphere_destination_folder

  num_cpus = each.value.num_cpus
  cpu_hot_add_enabled = each.value.cpu_hot_add_enabled

  memory = each.value.memory
  memory_hot_add_enabled = each.value.memory_hot_add_enabled

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
        host_name = each.value.name
        domain = each.value.domain
      }
      network_interface {
        ipv4_address = each.value.ipv4_address
        ipv4_netmask = each.value.ipv4_netmask
      }
      ipv4_gateway = each.value.ipv4_gateway
      dns_server_list = each.value.dns_server_list
      dns_suffix_list = each.value.dns_suffix_list
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
    host = each.value.ipv4_address
  }

  provisioner "file" {
    source = "../common/copy_files"
    destination = "/tmp"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod -R +x /tmp/copy_files/scripts/",
      "sudo /tmp/copy_files/scripts/reset-machine-id.sh",
      "sudo /tmp/copy_files/scripts/customize-profiles.sh",
      "sudo /tmp/copy_files/scripts/create-local-user.sh",
      "sudo /tmp/copy_files/scripts/update-sshd_config.sh",
      "sudo rm -rf /tmp/copy_files"
    ]
    
  }
}
