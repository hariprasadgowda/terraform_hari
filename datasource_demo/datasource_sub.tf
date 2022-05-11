data "azurerm_subscription" "current_sub" {
  
}

output "current_sub_name" {
     value = data.azurerm_subscription.current_sub.display_name
  
}