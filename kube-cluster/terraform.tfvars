vsphere_template_folder = "Templates"
vsphere_template_name = "tf_ubuntu2004_template"

vsphere_destination_folder = "Test"

vm_provisioner_username = "provisioner"

vm_list = [
    {
        name = "tf-kubecp"
        domain = "local"
        num_cpus = 2
        memory = 8192
        cpu_hot_add_enabled = true
        memory_hot_add_enabled = true
        ipv4_address = "192.168.1.91"
        ipv4_netmask = 24
        ipv4_gateway = "192.168.1.1"
        dns_server_list = ["192.168.1.1"]
        dns_suffix_list = [""]
    },
    {
        name = "tf-kubew01"
        domain = "local"
        num_cpus = 2
        memory = 8192
        cpu_hot_add_enabled = true
        memory_hot_add_enabled = true
        ipv4_address = "192.168.1.92"
        ipv4_netmask = 24
        ipv4_gateway = "192.168.1.1"
        dns_server_list = ["192.168.1.1"]
        dns_suffix_list = [""]
    },
    {
        name = "tf-kubew02"
        domain = "local"
        num_cpus = 2
        memory = 8192
        cpu_hot_add_enabled = true
        memory_hot_add_enabled = true
        ipv4_address = "192.168.1.93"
        ipv4_netmask = 24
        ipv4_gateway = "192.168.1.1"
        dns_server_list = ["192.168.1.1"]
        dns_suffix_list = [""]
    }
]