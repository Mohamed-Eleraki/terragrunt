# Terragrunt Configuration File for Log Analytics Module
# This file configures the deployment of the log analytics module.
# It specifies the Terraform source, includes parent configurations, manages dependencies, and passes inputs.
# Terragrunt is a thin wrapper for Terraform that provides extra tools for:
# - Keeping configurations DRY (Don't Repeat Yourself)
# - Working with multiple Terraform modules
# - Managing remote state
# - Locking state files
# - Generating Terraform code dynamically

# terraform Block
# The terraform block specifies the source of the Terraform module to deploy.
# The 'source' can be a local path, Git URL, or Terraform Registry module.
# This allows Terragrunt to know which module to run Terraform commands on.
terraform {
  source = "../../../modules/modules/Foundation/log-analytics"
}

# include Block
# The include block allows you to include configurations from parent directories.
# This enables hierarchical configuration inheritance.
# find_in_parent_folders() searches upwards for the specified file and returns its path.
# Here, it includes the root terragrunt.hcl which contains remote_state and other shared configs.
include {
  path = find_in_parent_folders("terragrunt.hcl")
}

# dependency Block
# The dependency block allows you to specify dependencies on other Terragrunt modules.
# Terragrunt will ensure dependent modules are applied before this one.
# The 'config_path' specifies the relative path to the dependent module.
# 'mock_outputs' provides dummy values for outputs when the dependency hasn't been applied yet.
# This is useful for planning and validation without deploying all dependencies first.
dependency "resource-group" {
  config_path = "../resource-group"

  mock_outputs = {  # dummy value
    resource_group_name = "mock-rg-name"
  }
}

# inputs Block
# The inputs block allows you to pass variables to the Terraform module.
# These values override the default variables defined in the module's variables.tf.
# Inputs can reference outputs from dependencies using dependency.<name>.outputs.<output_name>
inputs = {
  host_environment_short = "d"
  region_short           = "we"
  sysrole                = "sharedapps"
  resource_number        = 01
  region                 = "West Europe"
  # Reference to the resource group name output from the dependency
  resource_group_name    = dependency.resource-group.outputs.resource_group_name
  retention_in_days      = 30
}

# Additional Terragrunt Blocks (Commented for Reference)

# generate Block
# The generate block allows Terragrunt to dynamically generate Terraform code.
# This is useful for creating provider configurations, backend configs, etc.
# generate "provider" {
#   path      = "provider.tf"
#   if_exists = "overwrite"
#   contents  = <<EOF
# provider "azurerm" {
#   features {}
# }
# EOF
# }

# locals Block
# The locals block allows you to define local values that can be reused.
# Similar to Terraform locals, but at the Terragrunt level.
# locals {
#   common_tags = {
#     Environment = "dev"
#     Module      = "log-analytics"
#   }
# }

# Usage Notes:
# - Run 'terragrunt plan' to see what changes will be made
# - Run 'terragrunt apply' to apply the changes
# - Run 'terragrunt destroy' to destroy the infrastructure
# - Terragrunt automatically handles state locking and unlocking
# - Dependencies are resolved automatically
# - Use 'terragrunt output' to see outputs from this module
