resource "azurerm_container_registry" "acr" {
  name                = "cp2UnirAcr"
  resource_group_name = azurerm_resource_group.gauladell-rg.name
  location            = azurerm_resource_group.gauladell-rg.location
  sku                 = "Standard"
  admin_enabled       = false
}