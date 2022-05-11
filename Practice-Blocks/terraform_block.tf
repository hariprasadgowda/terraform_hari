terraform {
   required_version = ">=0.14.0"
   required_providers {
     azurerm ={
       source  = "hashicorp/azurerm"
       version = ">=2.60"
     }
   }
}
  

provider "azurerm" {
  features{}
}

resource "azurerm_resource_group" "RG" {

  name = "my_rg"
  location = "East US"

}




 