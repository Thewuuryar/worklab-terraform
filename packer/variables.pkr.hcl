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

variable "vm_ssh_user" {
  type = string
  default = ""
}

variable "vm_ssh_password" {
  type = string
  default = ""
}

variable "vm_network_ip" {
  type = string
  default = ""
}

variable "vm_network_gateway" {
  type = string
  default = ""
}

variable "vm_network_mask" {
  type = string
  default = ""
}

variable "vm_hostname" {
  type = string
  default = ""
}

variable "vm_name" {
  type = string
  default = ""
}

variable "vm_guest_os" {
  type = string
  default = ""
}

variable "vsphere_insecure_connection" {
  type = bool
  default = true
}

variable "vm_cpus" {
  type = number
  default = 2
}

variable "vm_cpu_hot_plug" {
  type = bool
  default = true
}

variable "vm_ram" {
  type = number
  default = 4096
}

variable "vm_ram_hot_plug" {
  type = bool
  default = true
}

variable "vm_disk_size" {
  type = number
  default = 102400
}

variable "vm_disk_eagerly_scrub" {
  type = bool
  default = true
}

variable "vm_disk_thin_provisioned" {
  type = bool
  default = false
}

variable "vm_disk_controller_type" {
  type = list(string)
  default = ["pvscsi"]
}

variable "vm_iso_path" {
  type = string
  default = ""
}

variable "vm_kickstart_file" {
  type = string
  default = ""
}

variable "vm_network_card" {
  type = string
  default = ""
}


