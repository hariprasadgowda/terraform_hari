#virtual Network
resource "azurerm_virtual_network" "myvnet" {

  name                = "${var.business_unit}-${var.environment}-${var.vnet_name}"
  address_space       = var.vnet_address_space
  location            = azurerm_resource_group.myRG.location
  resource_group_name = azurerm_resource_group.myRG.name
  tags = var.common_tags
}

#subnet
resource "azurerm_subnet" "mysubnet" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.myRG.name
  virtual_network_name = azurerm_virtual_network.myvnet.name
  address_prefixes     = ["10.4.0.0/24"]
}

#public IP address
resource "azurerm_public_ip" "mypublicip" {
  #this will add explicit dependency, thus publicip will create only after the vnet and subnet got created
  depends_on = [
    azurerm_virtual_network.myvnet,
    azurerm_subnet.mysubnet
  ]
  name                = "mypubip-1"
  resource_group_name = azurerm_resource_group.myRG.name
  location            = azurerm_resource_group.myRG.location
  allocation_method   = "Static"
  #Maping RG location in order to create SKU according to the loication of RG using lookup function
  sku = "Basic"
  tags = var.common_tags
}

#network-Interface

resource "azurerm_network_interface" "mynic" {
  name                = "mynic-1"
  location            = azurerm_resource_group.myRG.location
  resource_group_name = azurerm_resource_group.myRG.name
  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.mysubnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.mypublicip.id
  }
  tags = var.common_tags
}