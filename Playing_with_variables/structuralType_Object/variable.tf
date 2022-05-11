# Businessunit variable
variable "business_unit" {
  description = "Business unit name"
  type        = string
  default     = "finance"

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

#common tags
variable "common_tags" {
  description = "azure resources common tag"
  type = map(string)
  default = {
    "IAC" = "terraform"
    "Provisioner" = "Hari"
  }
  
}

#Azure MySQL DB Name (Variable Type: String)
variable "db_name" {
  description = "database_name"
  type = string
  
}

#Azure MySQL DB Username (Variable Type: Sensitive String)

variable "db_username" {
  description = "azure db admin username"
  type = string
  sensitive = true

}

#Azure MySQL DB Password (Variable Type: Sensitive String)
variable "db_password" {
  description = "azure db admin password"
  type = string
  sensitive = true

}
#Azure MySQL DB Storage in MB (Variable Type: Number)
variable "db_storage_spaceMB" {
  description = "database storage in MB"
  type = number
}

#Azure MYSQL DB auto_grow_enabled (Variable Type: Boolean)
variable "db_autogrow_enabled" {
  description = "boolean value for database auto grow parameters"
  type = bool
  
}

#azure sql db threat detection Policy (using Structural type OBJECT )
variable "db_threat_policy" {
  description = "azure mysql db threat detection policy"
  type = object({
   enabled = bool
   retention_days = number
   email_account_admins = bool
   email_addresses = list(string)
  })
}