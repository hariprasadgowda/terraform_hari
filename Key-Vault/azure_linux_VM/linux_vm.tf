#linux VM resource
resource "azurerm_linux_virtual_machine" "linuxvm" {
    name = "linuxvm-1"
    #hostname which is optional
    computer_name = "mytestvm-1"
    resource_group_name = azurerm_resource_group.myRG.name
    location = azurerm_resource_group.myRG.location
    size = "Standard_DS1_V2"
    admin_username = "azureuser"
    network_interface_ids = [ azurerm_network_interface.mynic.id ]
    admin_ssh_key {
      username = "azureuser"
      public_key = file("${path.module}/ssh_keys/terraform-azure.pub")
    }
    os_disk {
      name = "osdisk-${linuxvm.name}"
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
