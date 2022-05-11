resource "azurerm_resource_group" "myRG" {
  name     = "${var.business_unit}-${var.environment}-${var.rg_name}"
  location = var.rg_location

}