vsphere_template_folder = "Templates"
vsphere_template_name = "tf_rhel8_template"

vsphere_destination_folder = "Test"

vm_provisioner_username = "provisioner"

vm_list = [
    {
        name = "tf-testvm"
        domain = "local"
        num_cpus = 1
        memory = 2048
        cpu_hot_add_enabled = true
        memory_hot_add_enabled = true
        ipv4_address = "192.168.1.82"
        ipv4_netmask = 24
        ipv4_gateway = "192.168.1.1"
        dns_server_list = ["192.168.1.1"]
        dns_suffix_list = [""]
    }
]