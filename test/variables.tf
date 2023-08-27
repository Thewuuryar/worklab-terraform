variable "vsphere_server" {
  type = string
  default = ""
}

variable "vsphere_svc_user_name" {
  type = string
  default = ""
}

variable "vsphere_svc_user_password" {
  type = string
  default = ""
}

variable "vsphere_datacenter" {
  type = string
  default = ""
}

variable "vsphere_cluster" {
  type = string
  default = ""
}

variable "vsphere_datastore" {
  type = string
  default = ""
}

variable "vsphere_network" {
  type = string
  default = ""
}

variable "vsphere_destination_folder" {
  type = string
  default = ""
}

variable "vsphere_template_folder" {
  type = string
  default = "Templates"
}

variable "vsphere_template_name" {
  type = string
  default = ""
}

variable "vm_provisioner_username" {
  type = string
  default = ""
}

variable "vm_provisioner_password" {
  type = string
  default = ""
}

variable "vm_list" {
  description = "List of VMs to be built"
  type = list(object({
    name = string
    domain = string
    num_cpus = number
    memory = number
    cpu_hot_add_enabled = bool
    memory_hot_add_enabled = bool
    ipv4_address = string
    ipv4_netmask = number
    ipv4_gateway = string
    dns_server_list = list(string)
    dns_suffix_list = list(string)
  }))
  default = [
    {
      name = "tf_default"
      domain = "local"
      num_cpus = 1
      memory = 1024
      cpu_hot_add_enabled = true
      memory_hot_add_enabled = true
      ipv4_address = "192.168.1.31"
      ipv4_netmask = 24
      ipv4_gateway = "192.168.1.1"
      dns_server_list = ["192.168.1.1"]
      dns_suffix_list = [""]
    }
  ]
}
