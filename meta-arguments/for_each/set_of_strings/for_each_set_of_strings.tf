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



#creating Resource groups using for_each set of strings(toset)
resource "azurerm_resource_group" "myrg" {
    for_each = toset([ "eastus","eastus2","westus" ])
  name = "rg-${each.value}"
  location = each.key
}

/* 
we can also use each.value as each.key
that means each.key=each.value
*/

