
resource "azurerm_resource_group" "myRG" {
    name = "my-RG1"
    location = "East US"
  
}

#virtual Network
resource "azurerm_virtual_network" "myvnet" {

  name = "myvnet1"
  address_space = ["10.0.0.0/16"]
  location = azurerm_resource_group.myRG.location
  resource_group_name = azurerm_resource_group.myRG.name
  tags = {
    "reason" = "test VNET"
  }
}

#subnet
resource "azurerm_subnet" "mysubnet" {
  name = "subnet1"
  resource_group_name = azurerm_resource_group.myRG.name
  virtual_network_name = azurerm_virtual_network.myvnet.name
  address_prefixes = ["10.0.1.0/24"]

}

#public IP address
resource "azurerm_public_ip" "mypublicip"{
  count = 2 
  name = "mypubip-${count.index+1}"
  resource_group_name = azurerm_resource_group.myRG.name
  location = azurerm_resource_group.myRG.location
  allocation_method = "Static"
  domain_name_label = "app1-vm-${count.index+1}-${random_string.mystring1.id}"
  tags = {
    "environment" = "public"
  }
}

#network-Interface

resource "azurerm_network_interface" "mynic" {
  count = 2
 name = "mynic-${count.index+1}"
 location = azurerm_resource_group.myRG.location
 resource_group_name = azurerm_resource_group.myRG.name
 ip_configuration {
   name = "internal"
   subnet_id = azurerm_subnet.mysubnet.id
   private_ip_address_allocation = "Dynamic"
   #public_ip_address_id = azurerm_public_ip.mypublicip.id
   #usingv splat expression( [*] ), element function
   public_ip_address_id = element(azurerm_public_ip.mypublicip[*].id, count.index+1)
 }
}
