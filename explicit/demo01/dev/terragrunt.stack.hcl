# Dev environment stack configuration
# This defines the infrastructure components to be deployed in the dev environment
# Units are deployed in dependency order

# Resource group unit - creates the base resource group for other resources
unit "resource-group" {
  source = "../modules/resource-group"
  path   = "resource-group"
  values = {
    host_environment_short = "d"
    region_short           = "we"
    sysrole                = "containerapps"
    region                 = "westeurope"
  }
}

# Log analytics unit - creates log analytics workspace that depends on the resource group
unit "log-analytics" {
  source = "../modules/log-analytics"
  path   = "log-analytics"
  values = {
    host_environment_short = "d"
    region_short           = "we"
    sysrole                = "sharedapps"
    resource_number        = "01"
    region                 = "West Europe"
    retention_in_days      = 30
  }
}
