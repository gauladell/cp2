# He utilizado parte de la plantilla de https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs


terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.86.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  skip_provider_registration = true # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {}
  subscription_id = var.subscription_id
  tenant_id = var.tenant_id
}

# Create a resource group
resource "azurerm_resource_group" "gauladell-rg" {
  name     = "cp2-resources"
  location = "West Europe"
}

resource "azurerm_storage_account" "stacc" {
  name                     = "staccgauladell"
  resource_group_name      = azurerm_resource_group.gauladell-rg.name
  location                 = azurerm_resource_group.gauladell-rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "CP2"
  }
}














