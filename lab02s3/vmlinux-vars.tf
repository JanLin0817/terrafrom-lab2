variable "linux_name" {
  type    = string
  default = "n01742406-u-vm1"
}

variable "linux_vm_size" {
  type    = string
  default = "Standard_D2as_v5"
}

variable "linux_admin_username" {
  type    = string
  default = "n01742406"
}

variable "linux_public_key_path" {
  type    = string
  default = "/Users/n01742406/.ssh/id_rsa.pub"
}

variable "linux_storage_account_type" {
  type    = string
  default = "Premium_LRS"
}

variable "linux_disk_size" {
  type    = string
  default = "32"
}

variable "linux_disk_caching" {
  type    = string
  default = "ReadWrite"
}

variable "linux_publisher" {
  type    = string
  default = "Canonical"
}

variable "linux_offer" {
  type    = string
  default = "0001-com-ubuntu-server-jammy"
}

variable "linux_sku" {
  type    = string
  default = "22_04-lts"
}

variable "linux_version" {
  type    = string
  default = "latest"
}
