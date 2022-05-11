#whatever we provided in the default values of variable.tf file it will override that
business_unit      = "hr"
environment        = "prd"

#rg variables
rg_name            = "rg2"
rg_location        = "eastus"


#db Variables
db_name = "mysqldb1998"
db_storage_spaceMB = 5120
db_autogrow_enabled = true
/*db_threat_policy = {
  email_account_admins = true,
  email_addresses = [ "hariprasadgowda1998@gmail.com","hariprasadgowda31@outlook.com" ],
  enabled = true,
  retention_days = 10
}
*/
db_threat_policy = [true, 10, true, [ "hariprasadgowda1998@gmail.com","hariprasadgowda31@outlook.com" ]]