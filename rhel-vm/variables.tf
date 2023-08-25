variable "vsphere_server" {
  type = string
  default = ""
}

variable "vsphere_user" {
  type = string
  default = ""
}

variable "vsphere_password" {
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

variable "vsphere_folder" {
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

variable "vm_name" {
  type = string
  default = ""
}

variable "vm_num_cpus" {
  type = number
  default = 2
}

variable "vm_cpu_hot_add_enabled" {
  type = bool
  default = true
}

variable "vm_memory" {
  type = number
  default = 4096
}

variable "vm_memory_hot_add_enabled" {
  type = bool
  default = true
}

variable "vm_ipv4_address" {
  type = string
  default = ""
}

variable "vm_ipv4_netmask" {
  type = number
  default = 24
}

variable "vm_ipv4_gateway" {
  type = string
  default = ""
}

variable "vm_domain" {
  type = string
  default = ""
}

variable "vm_dns_server_1" {
  type = string
  default = ""
}

variable "vm_dns_server_2" {
  type = string
  default = ""
}

variable "vm_dns_server_3" {
  type = string
  default = ""
}

variable "vm_dns_suffix_1" {
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