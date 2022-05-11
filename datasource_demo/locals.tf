locals {
  vnet_name = "${var.business_unit}-${var.environment}-${var.vnet_name}"

  vnet_address_space = (var.environment == "dev" ? var.vnet_addressspace_dev : var.vnet_addressspace_all)
}