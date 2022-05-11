# output values for Resource grpoup
output "resource_group_id" {
    description = "resource group ID"
    value = azurerm_resource_group.myrg.id
}

output "resource_group_name" {
    description = "resource group name"
    value = azurerm_resource_group.myrg.name
}
#output values for VNET

output "virtual_network_name" {
    description = "vnet name"
    value = azurerm_virtual_network.myvnet[*].name
}