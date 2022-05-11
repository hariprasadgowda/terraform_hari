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


#azure resource groups using for_each
resource "azurerm_resource_group" "myrg" {
    for_each = {
      myapp1 = "East US"
      myapp2 = "eastus2"
      myapp3 = "West US"
    }
    name = "${each.key}-rg"
    location = each.value
  
}