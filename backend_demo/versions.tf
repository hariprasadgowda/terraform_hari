#terraform block
terraform {
  required_version = ">=1.0.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.0"
    }
  }
  backend "azurerm" {
    resource_group_name = "hari-terraform-rg"
    storage_account_name = "hariterrfaormtest123"
    container_name = "terraformstate"
    key = "terraform.tfstate"
  }
}

#provider block
provider "azurerm" {
  features {}
} 