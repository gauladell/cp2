variable "subscription_id" {
  description = "Azure Subscription ID"
} 

variable "tenant_id" {
    description = "Azure Tenant ID"  
}
variable "client_id" {
  description = "Azure Kubernetes Service Client ID"
}

variable "password" {
  description = "Azure Kubernetes Service Client Secret"
}

variable "location" {
    type = string
    description = "Región de Azure donde crearemos la infrastructura"
    default = "West Europe"  
}

variable "vm_size" {
    type = string
    description = "Tamaño de la máquina virtual"
    default = "Standard_DS1_v2" #3.5 GB, 1 CPU  
}