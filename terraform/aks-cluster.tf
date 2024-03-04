resource "random_pet" "prefix" {}

#data "azuread_client_config" "current" {}

#Según he entendido en la documentación hay que crear un service principal para que el cluster de aks funcione y para ello necesitamos crear primero una aplicación de azuread para que funcione y el service principal pueda utilizarla.
#resource "azuread_application" "azad" {
#  display_name = "azad-gauladell"
#  owners       = [data.azuread_client_config.current.object_id]
#}


#resource "azuread_service_principal" "svp" {
#  client_id     = azuread_application.azad.client_id  
#  use_existing = true
#  owners = [data.azuread_client_config.current.object_id]
#}

# Esto lo he copiado del ejemplo, pero básicamente definimos un nombre rándom dentro de nuestro grupo de recursos "gauladell-unir"
# y definimos el nombre del cluster, la ubicación, el grupo de recursos, el prefijo del DNS y la versión de kubernetes que vamos a utilizar
# Create a resource group
resource "azurerm_kubernetes_cluster" "aks" {
  name                = "${random_pet.prefix.id}-aks"
  location            = azurerm_resource_group.gauladell-rg.location
  resource_group_name = azurerm_resource_group.gauladell-rg.name
  dns_prefix          = "${random_pet.prefix.id}-k8s"
  kubernetes_version  = "1.29"
 

  linux_profile {
    admin_username = "gauladell"

    ssh_key {
      key_data = file("~/.ssh/id_rsa.pub")
    }
  }

  #Definimos el pool de nodos que vamos a utilizar en nuestro caso vamos a usar la máquina más básica y 1 solo nodo con un disco de 30GB
  default_node_pool {
    name            = "default"
    node_count      = 1
    vm_size         = "Standard_D2_v2"
    os_disk_size_gb = 30
  }
  identity {
    type = "SystemAssigned"
  }
  network_profile {
    network_plugin    = "kubenet"
    load_balancer_sku = "standard"
  }

  tags = {
    environment = "CP2"
  }


}