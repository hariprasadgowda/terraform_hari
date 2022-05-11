terraform {
  required_version = ">=0.14.0"
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = ">=2.60"
    }
    random ={
        source = "hashicorp/random"
        version = ">=3.0"
    }
  }
  backend "azurerm" {
    resource_group_name = "hari-terraform-rg"
    storage_account_name = "hariterrfaormtest123"
    
    container_name = "terraformstate"
    key = "terraform_pipeline.tfstate"
    
  }
}

provider "azurerm" {
    features {
      
    }
  
}


resource "azurerm_resource_group" "storageRG" {
  name = "devopspipeline-rg"
  location = "East US"
}

resource "random_string" "randomName" {
    length = 16
    special = false
    upper = false
  
}

resource "azurerm_storage_account" "mysa" {
  name                     = "mysa${random_string.randomName.id}"
  resource_group_name      = azurerm_resource_group.storageRG.name
  location                 = azurerm_resource_group.storageRG.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "test"
  }
}