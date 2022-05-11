# Businessunit variable
variable "business_unit" {
  description = "Business unit name"
  type        = string
  default     = "Finance"

}

#environment variable
variable "environment" {
  description = "environment name"
  type        = string
  default     = "test"

}

# resource group name variable
variable "rg_name" {
  description = "resource group name"
  type        = string
  default     = "myrg"
}

# location variable
variable "rg_location" {
  description = "resource group location"
  type        = string
  default     = "East US"
}

# virtual network name variable

variable "vnet_name" {
  description = "virtual network name"
  type        = string
  default     = "myvnet"
}

#subnet name variable
# we should not use default argument in order for it to prompt while running script
variable "subnet_name" {
  description = "name of the subnet"
  type        = string

}

#virtual network Address space
variable "vnet_address_space" {
  description = "virtual network Address space"
  type        = list(string)
  default     = ["10.0.0.0/16", "10.1.0.0/16"]
}

#Public IP SKU
variable "public_ip_sku" {
  description = "azure public ip sku"
  type = map(string)
  default = {
    "eastus" = "Basic"
    "eastus2"= "Standard"
  }
  
}

#common tags
variable "common_tags" {
  description = "azure resources common tag"
  type = map(string)
  default = {
    "IAC" = "terraform"
    "Provisioner" = "Hari"
  }
  
}