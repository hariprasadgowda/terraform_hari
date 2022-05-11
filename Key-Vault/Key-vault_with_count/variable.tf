variable "key_vault_name"{
    type = list(string)
    default = ["keyvault0000000013", "keyvault0000000014", "keyvault0000000015"]
}
variable "key_vault_location" {
    default = "east us"
}

variable "resource_group_name" {
    default = "Test-RG"
}