data "azurerm_resource_group" "resource_group" {
  name = var.resource_group
}

data "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = data.azurerm_resource_group.resource_group.name
  virtual_network_name = var.vnet_name
}