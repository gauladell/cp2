#Security Group

resource "azurerm_network_security_group" "mySecGroup"{
    name = "sshtraffic"
    location = azurerm_resource_group.gauladell-rg.location
    resource_group_name = azurerm_resource_group.gauladell-rg.name
    security_rule {
        name                       = "SSH"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }   
     security_rule {
        name                       = "HTTP"
        priority                   = 1002
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }  

     security_rule {
        name                       = "HTTPS"
        priority                   = 1003
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "443"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }  

    tags = {
        environment = "CP2"
    }
}

#Asociamos la red con el grupo de seguridad
resource "azurerm_network_interface_security_group_association" "mySecGroupAssociation" {
    network_interface_id      = azurerm_network_interface.myNIC.id
    network_security_group_id = azurerm_network_security_group.mySecGroup.id
}