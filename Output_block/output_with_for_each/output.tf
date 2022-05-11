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
# for loop - one input generates output with one list
output "virtual_network_name_list_one_input" {
    description = "vnet name"
    value = [for vnet in azurerm_virtual_network.myvnet: vnet.name]
}

# for loop two inputs and list outputs
output "virtual_network_name_list_two_inputs" {
    description = "vnet name by passing two inputs and list outputs with iterator i, before comma it will consider as iterator"
    value = [for i, vnet in azurerm_virtual_network.myvnet: i]
}

#for loop one input and map output 
output "virtual_network_name_map_one_input" {
    description ="for loop-one input and map output  "
    value = { for vnet in azurerm_virtual_network.myvnet: vnet.id => vnet.name}
}
#for loop two input and map output
output "virtual_network_name_map_two_input" {
    description ="for loop-one input and map output  "
    value = { for env, vnet in azurerm_virtual_network.myvnet: env => vnet.name}
}


#terraform keys() function
output "virtual_network_name_keys_function" {
    description ="terraform keys() function"
    value =keys({ for env, vnet in azurerm_virtual_network.myvnet: env => vnet.name})
}

#terraform values() function
output "virtual_network_name_values_function" {
    description ="terraform values() function"
    value =values({ for env, vnet in azurerm_virtual_network.myvnet: env => vnet.name})
}
