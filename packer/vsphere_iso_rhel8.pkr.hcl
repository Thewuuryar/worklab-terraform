source "vsphere-iso" "rhel8" {
    vcenter_server = var.vsphere_server
    username = var.vsphere_user
    password = var.vsphere_password
    datacenter = var.vsphere_datacenter
    cluster = var.vsphere_cluster
    insecure_connection = true

    vm_name = "tf_rhel8_template"
    folder = var.vsphere_template_folder
    guest_os_type = "rhel8_64Guest"

    ssh_username = var.vm_user
    ssh_password = var.vm_password

    CPUs = 2
    CPU_hot_plug = true
    RAM = 4096
    RAM_hot_plug = true

    disk_controller_type = ["pvscsi"]
    datastore = var.vsphere_datastore
    storage {
        disk_size = 102400
        disk_eagerly_scrub = true
        disk_thin_provision = false
    }

    iso_paths = [""]

    network_adapters {
        network = var.vsphere_network
        network_card = "vmxnet3"
    }
}