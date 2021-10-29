resource "azurerm_network_interface" "gateway_public" {
  name                 = "${var.vm_name}interface"
  location             = data.azurerm_resource_group.resource_group.location
  resource_group_name  = data.azurerm_resource_group.resource_group.name
  enable_ip_forwarding = false

  ip_configuration {
    name                          = "myconfig"
    subnet_id                     = data.azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "virtual_machine" {
  location              = data.azurerm_resource_group.resource_group.location
  name                  = var.vm_name
  network_interface_ids = [azurerm_network_interface.gateway_public.id]
  resource_group_name   = data.azurerm_resource_group.resource_group.name
  admin_username        = "azureuser"
  admin_password        = var.password
  size                  = "Standard_B1ls"
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    offer     = "0001-com-ubuntu-server-focal"
    publisher = "Canonical"
    version   = "latest"
    sku       = "20_04-lts"
  }
}