# Businessunit variable
variable "business_unit" {
    description = "Business unit name"
    type = string
    default = "Finance"
  
}

#environment variable
variable "environment" {
    description = "environment name"
    type = string
    default = "test"
  
}

# resource group name variable
variable "rg_name" {
  description = "resource group name"
  type = string
  default = "myrg"
}

# location variable
variable "rg_location" {
  description = "resource group location"
  type = string
  default = "East US"
}

# virtual network name variable

variable "vnet_name" {
  description = "virtual network name"
  type = string
  default = "myvnet"
}

#subnet name variable
# we should not use default argument in order for it to prompt while running script
variable "subnet_name" {
  description = "name of the subnet"
  type = string
  
}