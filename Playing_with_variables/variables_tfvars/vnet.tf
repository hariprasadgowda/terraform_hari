#virtual Network
resource "azurerm_virtual_network" "myvnet" {

  name = "${var.business_unit}-${var.environment}-${var.vnet_name}"
  address_space = ["10.0.0.0/16"]
  location = azurerm_resource_group.myRG.location
  resource_group_name = azurerm_resource_group.myRG.name
  tags = {
    "reason" = "test VNET"
  }
}

#subnet
resource "azurerm_subnet" "mysubnet" {
  name = var.subnet_name
  resource_group_name = azurerm_resource_group.myRG.name
  virtual_network_name = azurerm_virtual_network.myvnet.name
  address_prefixes = ["10.0.1.0/24"]

}

#public IP address
resource "azurerm_public_ip" "mypublicip"{
    #this will add explicit dependency, thus publicip will create only after the vnet and subnet got created
    depends_on = [
    azurerm_virtual_network.myvnet,
    azurerm_subnet.mysubnet
    ]
  name = "mypubip-1"
  resource_group_name = azurerm_resource_group.myRG.name
  location = azurerm_resource_group.myRG.location
  allocation_method = "static"
  domain_name_label = "app1-vm-${random_string.mystring1.id}"
  tags = {
    "environment" = "public"
  }
}

#network-Interface

resource "azurerm_network_interface" "mynic" {
 name = "mynic-1"
 location = azurerm_resource_group.myRG.location
 resource_group_name = azurerm_resource_group.myRG.name
 ip_configuration {
   name = "internal"
   subnet_id = azurerm_subnet.mysubnet.id
   private_ip_address_allocation = "Dynamic"
   public_ip_address_id = azurerm_public_ip.mypublicip.id
 }
}