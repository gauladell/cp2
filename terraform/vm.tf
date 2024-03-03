#Creamos  una maquina virtual

resource "azurerm_linux_virtual_machine" "myVM1" {
    name               = "gauladell-vm"
    resource_group_name = azurerm_resource_group.gauladell-rg.name
    location = azurerm_resource_group.gauladell-rg.location
    size               = var.vm_size
    admin_username = "gauladell"
    network_interface_ids = [azurerm_network_interface.myNIC.id]
    disable_password_authentication = true

    admin_ssh_key {
        username   = "gauladell"
        public_key = file("~/.ssh/id_rsa.pub")
    }

    os_disk {
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }

    source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

   tags = {
    environment = "CP2"
  }
}
