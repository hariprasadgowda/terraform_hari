#linux VM resource
resource "azurerm_linux_virtual_machine" "linuxvm" {
  count = 2
    name = "linuxvm-${count.index+1}"
    #hostname which is optional
    computer_name = "mytestvm-${count.index+1}"
    resource_group_name = azurerm_resource_group.myRG.name
    location = azurerm_resource_group.myRG.location
    size = "Standard_DS1_V2"
    admin_username = "azureuser"
    #using splat expression( [*] ), element function
    network_interface_ids = [ element(azurerm_network_interface.mynic[*].id, count.index+1 ) ]
    admin_ssh_key {
      username = "azureuser"
      public_key = file("${path.module}/ssh_keys/terraform-azure.pub")
    }
    os_disk {
      name = "osdisk-${count.index+1}"
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
