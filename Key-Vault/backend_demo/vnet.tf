#virtual Network
resource "azurerm_virtual_network" "myvnet" {

  name                = local.vnet_name
  address_space       = local.vnet_address_space
  location            = azurerm_resource_group.myRG.location
  resource_group_name = azurerm_resource_group.myRG.name
  tags = {
    "reason" = "test VNET"
  }
}

