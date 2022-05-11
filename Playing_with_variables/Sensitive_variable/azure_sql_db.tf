# azure sql server resource
resource "azurerm_mysql_server" "sql_server" {
  name = "${var.business_unit}${var.environment}${var.db_name}"
  resource_group_name = azurerm_resource_group.myRG.name
  location = azurerm_resource_group.myRG.location

  administrator_login = var.db_username
  administrator_login_password = var.db_password

  sku_name   = "B_Gen5_2"
  storage_mb = var.db_storage_spaceMB
  version    = "8.0"

  auto_grow_enabled                 = var.db_autogrow_enabled
  backup_retention_days             = 7
  geo_redundant_backup_enabled      = false
  infrastructure_encryption_enabled = false
  public_network_access_enabled     = true
  ssl_enforcement_enabled           = true
  ssl_minimal_tls_version_enforced  = "TLS1_2"
  tags = var.common_tags
 
}

#azure sql database resource
resource "azurerm_mysql_database" "mysqldb" {
   name                = "mydb01"
  resource_group_name = azurerm_resource_group.myRG.name
  server_name         = azurerm_mysql_server.sql_server.name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
  
}