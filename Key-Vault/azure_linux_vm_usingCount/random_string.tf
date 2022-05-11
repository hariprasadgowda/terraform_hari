#terraform block
terraform{
    required_version = ">=1.0.0"

    required_providers{
        azurerm ={
            source ="hashicorp/azurerm"
            version = ">= 2.0"
        }

        random ={
            source = "hashicorp/random"
            version = ">= 3.0"
        }
    }
}

#provider block
provider "azurerm" {
    features{}
} 

#random string
resource "random_string" "mystring1"{
    length = 6
    special = false
    upper = false
    number = false

}