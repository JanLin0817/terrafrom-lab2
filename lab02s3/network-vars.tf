variable "resource_group_name" {
  type    = string
  default = "network-rg"
}

variable "location" {
  type    = string
  default = "Canada Central"
}

variable "network_vnet_name" {
  type    = string
  default = "network-vnet"
}

variable "network_address_space" {
  type    = list(string)
  default = ["10.0.0.0/16"]
}

variable "network_subnet1_name" {
  type    = string
  default = "network-subnet1"
}

variable "network_subnet1_address_prefix" {
  type    = list(string)
  default = ["10.0.0.0/24"]
}

variable "network_nsg1_name" {
  type    = string
  default = "network-nsg1"
}

variable "network_subnet2_name" {
  type    = string
  default = "network-subnet2"
}

variable "network_subnet2_address_prefix" {
  type    = list(string)
  default = ["10.0.1.0/24"]
}

variable "network_nsg2_name" {
  type    = string
  default = "network-nsg2"
}