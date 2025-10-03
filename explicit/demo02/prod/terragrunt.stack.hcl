# Prod environment stack configuration
# This defines the infrastructure components to be deployed in the prod environment
# Units are deployed in dependency order

# Resource group unit - creates the base resource group for other resources
unit "resource-group" {
  source = "../modules/resource-group"
  path   = "resource-group"
  values = {
    host_environment_short = "p"
    region_short           = "we"
    sysrole                = "containerapps"
    region                 = "West Europe"
  }
}

# Log analytics unit - creates log analytics workspace that depends on the resource group
unit "log-analytics" {
  source = "../modules/log-analytics"
  path   = "log-analytics"
  values = {
    host_environment_short = "p"
    region_short           = "we"
    sysrole                = "sharedapps"
    resource_number        = "01"
    region                 = "West Europe"
    resource_group_name    = "RG-p-we-containerapps"
    retention_in_days      = 30
  }
}
