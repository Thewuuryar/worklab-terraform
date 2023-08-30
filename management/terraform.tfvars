vsphere_template_folder = "Templates"
vsphere_template_name = "tf_rhel8_template"

vsphere_destination_folder = "Management"

vm_provisioner_username = "provisioner"

vm_list = [
    {
        name = "tf-ansible"
        domain = "local"
        num_cpus = 2
        memory = 8192
        cpu_hot_add_enabled = true
        memory_hot_add_enabled = true
        ipv4_address = "192.168.1.31"
        ipv4_netmask = 24
        ipv4_gateway = "192.168.1.1"
        dns_server_list = ["192.168.1.1"]
        dns_suffix_list = [""]
    },
    {
        name = "tf-satellite"
        domain = "local"
        num_cpus = 4
        memory = 20480
        cpu_hot_add_enabled = true
        memory_hot_add_enabled = true
        ipv4_address = "192.168.1.32"
        ipv4_netmask = 24
        ipv4_gateway = "192.168.1.1"
        dns_server_list = ["192.168.1.1"]
        dns_suffix_list = [""]
    },
    {
        name = "tf-netbox"
        domain = "local"
        num_cpus = 2
        memory = 8192
        cpu_hot_add_enabled = true
        memory_hot_add_enabled = true
        ipv4_address = "192.168.1.33"
        ipv4_netmask = 24
        ipv4_gateway = "192.168.1.1"
        dns_server_list = ["192.168.1.1"]
        dns_suffix_list = [""]
    }
]