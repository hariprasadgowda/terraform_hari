#terraform block
terraform{
    required_version = ">=1.0.0"

    required_providers{
        azurerm {
            source ="hashicorp/azurerm"
            version = ">= 2.0"
        }
    }
}

#provider block
provider "azurerm" {
    features{}
} 


resource "azurerm_resource_group" "myrg" {
  count = 3
  name = "myvm-${count.index}"
  location = "East US"
}