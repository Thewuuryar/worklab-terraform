source "vsphere-iso" "rhel8" {
    vcenter_server = var.vsphere_server
    username = var.vsphere_user
    password = var.vsphere_password
    datacenter = var.vsphere_datacenter
    cluster = var.vsphere_cluster
    insecure_connection = true

    vm_name = "tf_rhel8_template"
    folder = var.vsphere_folder
    guest_os_type = "rhel8_64Guest"

    ssh_username = var.vm_ssh_user
    ssh_password = var.vm_ssh_password

    CPUs = 2
    CPU_hot_plug = true
    RAM = 4096
    RAM_hot_plug = true

    disk_controller_type = ["pvscsi"]
    datastore = var.vsphere_datastore
    storage {
        disk_size = 102400
        disk_eagerly_scrub = true
        disk_thin_provisioned = false
    }

    iso_paths = [
        "library/rhel-8.8-x86_64-dvd/rhel-8.8-x86_64-dvd.iso"
    ]

    cd_files = ["./OEMDRV/ks.cfg"] # Requires install of Windows ADK for the oscdimg tool
    cd_label = "OEMDRV"

    network_adapters {
        network = var.vsphere_network
        network_card = "vmxnet3"
    }

    boot_command = [
       "<tab><wait>",
       " ip=${var.vm_network_ip}::${var.vm_network_gateway}:${var.vm_network_mask}:${var.vm_hostname}:ens192:none inst.text",
       "<enter>"
    ]
}

build {
    sources = [
        "source.vsphere-iso.rhel8"
    ]
}