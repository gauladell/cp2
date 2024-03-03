#Creación de la red
resource "azurerm_virtual_network" "myNet" {
  name                = "gauladell-vnet"
  location            = azurerm_resource_group.gauladell-rg.location
  resource_group_name = azurerm_resource_group.gauladell-rg.name
  address_space = ["10.0.0.0/16"]
  tags = {
    environment = "CP2"
  }
}

#Creación de la subred
resource "azurerm_subnet" "mySubnet" {
  name                 = "gauladell-subnet"
  resource_group_name  = azurerm_resource_group.gauladell-rg.name
  virtual_network_name = azurerm_virtual_network.myNet.name
  address_prefixes     = ["10.0.1.0/24"]
}

#Creación de la interfaz de red
resource "azurerm_network_interface" "myNIC" {
  name                = "gauladell-nic"
  location            = azurerm_resource_group.gauladell-rg.location
  resource_group_name = azurerm_resource_group.gauladell-rg.name

  ip_configuration {
    name                          = "ip1"
    subnet_id                     = azurerm_subnet.mySubnet.id
    private_ip_address_allocation = "Static"
    private_ip_address = "10.0.1.10"
    public_ip_address_id = azurerm_public_ip.myPublicIP.id
  }

  tags = {
    environment = "CP2"
  }
}

#Creación de la IP pública

resource "azurerm_public_ip" "myPublicIP" {
  name                = "gauladell-public-ip"
  location            = azurerm_resource_group.gauladell-rg.location
  resource_group_name = azurerm_resource_group.gauladell-rg.name
  allocation_method   = "Dynamic"
  sku = "Basic"

  tags = {
    environment = "CP2"
  }
}
