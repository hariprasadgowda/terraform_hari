terraform {
    required_providers {
        azurerm= {
            source = "hashicorp/azurerm"
            version = "~> 2.65"
        }
    }
    required_version = ">= 0.14.9"
}
provider "azurerm" {
    features{}
}
data "azurerm_client_config" "current" {

}
resource "azurerm_key_vault" "key_vault" {
    count = length(var.key_vault_name)
    name  = var.key_vault_name[count.index]
    location = var.key_vault_location
    resource_group_name = var.resource_group_name
    tenant_id = data.azurerm_client_config.current.tenant_id
    soft_delete_retention_days = 14
    sku_name = "standard"
}