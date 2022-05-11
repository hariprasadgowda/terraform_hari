#linux VM resource
resource "azurerm_linux_virtual_machine" "linuxvm" {
# instead of using for_each = toset(["vm1", "vm2"]) we are referencing the list 
  for_each = azurerm_network_interface.mynic #this is for_each chaining  
    name = "linuxvm-${each.key}"
    #hostname which is optional
    computer_name = "mytestvm-${each.key}"
    resource_group_name = azurerm_resource_group.myRG.name
    location = azurerm_resource_group.myRG.location
    size = "Standard_DS1_V2"
    admin_username = "azureuser"
    network_interface_ids = [azurerm_network_interface.mynic[each.key].id]
    admin_ssh_key {
      username = "azureuser"
      public_key = file("${path.module}/ssh_keys/terraform-azure.pub")
    }
    os_disk {
      name = "osdisk-${each.key}"
      caching = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }
    source_image_reference {
      publisher = "RedHat"
      offer = "RHEL"
      sku = "83-gen2"
      version = "latest"
    }

    custom_data = filebase64("${path.module}/init_scripts/cloud_init.txt")
}
