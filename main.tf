module "demo-module" {
  source = "github.com/lacj01-od/demo-kubevela"
  resource_group = var.resource_group
  vm_name = var.vm_name
  subnet_name = var.subnet_name
  vnet_name = var.vnet_name
  password = var.password
}

variable "resource_group" {
  type = string
}

variable "vm_name" {
  type = string
}

variable "subnet_name" {
  type = string
}

variable "vnet_name" {
  type = string
}

variable "password" {
  type = string
}