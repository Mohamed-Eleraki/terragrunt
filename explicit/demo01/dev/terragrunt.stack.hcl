# Terragrunt Stack Configuration File for Dev Environment
# This file defines a stack of infrastructure components to be deployed together.
# Terragrunt stacks allow you to define multiple units (modules) and their dependencies.
# Units are deployed in the order specified, respecting dependencies.
# Terragrunt is a thin wrapper for Terraform that provides extra tools for:
# - Keeping configurations DRY (Don't Repeat Yourself)
# - Working with multiple Terraform modules
# - Managing remote state
# - Locking state files
# - Generating Terraform code dynamically

# unit Block
# The unit block defines a single infrastructure component in the stack.
# Each unit corresponds to a Terragrunt module that will be deployed.
# Units can have dependencies on other units, and Terragrunt ensures correct deployment order.
# The 'source' specifies the path to the module directory.
# The 'path' specifies the relative path where the unit will be deployed.
# The 'values' block passes input variables to the module.

# Resource group unit - creates the base resource group for other resources
unit "resource-group" {
  # Source path to the module (relative to this file)
  source = "../modules/resource-group"
  # Path where this unit will be deployed (relative to the stack file location)
  path   = "resource-group"
  # Input values passed to the module
  values = {
    host_environment_short = "d"
    region_short           = "we"
    sysrole                = "containerapps"
    region                 = "westeurope"
  }
}

# Log analytics unit - creates log analytics workspace that depends on the resource group
unit "log-analytics" {
  # Source path to the module
  source = "../modules/log-analytics"
  # Path where this unit will be deployed
  path   = "log-analytics"
  # Input values, including reference to the resource group created by the previous unit
  values = {
    host_environment_short = "d"
    region_short           = "we"
    sysrole                = "sharedapps"
    resource_number        = "01"
    region                 = "West Europe"
    retention_in_days      = 30
  }
}

# Additional Terragrunt Stack Features (Commented for Reference)

# Dependencies between units can be implicit through values or explicit.
# Terragrunt automatically detects dependencies based on references in values.
# For explicit dependencies, you can use the 'depends_on' attribute in unit blocks.
# unit "dependent-unit" {
#   source = "../modules/dependent"
#   path   = "dependent"
#   depends_on = ["resource-group"]
#   values = {
#     # values here
#   }
# }

# Usage Notes:
# - Run 'terragrunt stack plan' to see what changes will be made for the entire stack
# - Run 'terragrunt stack apply' to apply the changes for the entire stack
# - Run 'terragrunt stack destroy' to destroy the entire stack
# - Terragrunt automatically handles state locking and unlocking
# - Stacks ensure units are deployed in dependency order
# - Use 'terragrunt stack output' to see outputs from all units
