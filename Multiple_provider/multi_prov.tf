terraform {
   required_version = ">=0.14.0"
   required_providers {
     azurerm ={
       source  = "hashicorp/azurerm"
       version = ">=2.60"
     }
   }
}

# provider1 (default provider)

provider "azurerm" {
    features{}
  
  }
#provider2 
provider "azurerm" {
    features {
      virtual_machine {
        delete_os_disk_on_deletion = true
      }
    }
    alias = "provider2-westus"
  
}
#using default provider
resource "azurerm_resource_group" "myrg1" {
    name = "rg1"
    location = "East US"
  
}

#using provider2
resource "azurerm_resource_group" "myrg2" {
    name = "rg2"
    location = "West US"
    provider = azurerm.provider2-westus
  
}