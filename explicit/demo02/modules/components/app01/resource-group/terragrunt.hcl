# Terragrunt Configuration File for Resource Group Module
# This file configures the deployment of the resource group module.
# It specifies the Terraform source, includes parent configurations, and passes inputs.
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
# Note: Using full path for local development; in production, use relative paths.
terraform {
  source = "/Users/moeraki/Documents/gitRepoDeloitte/terragrunt/explicit/demo02/modules/modules/resource-group"
}

# include Block
# The include block allows you to include configurations from parent directories.
# This enables hierarchical configuration inheritance.
# find_in_parent_folders() searches upwards for the specified file and returns its path.
# Here, it includes the root.hcl which contains remote_state and other shared configs.
include {
  path = find_in_parent_folders("root.hcl")
}

# inputs Block
# The inputs block allows you to pass variables to the Terraform module.
# These values override the default variables defined in the module's variables.tf.
# Here, values are passed from the stack configuration using the 'values' object.
inputs = {
  host_environment_short = values.host_environment_short
  region_short           = values.region_short
  sysrole                = values.sysrole
  region                 = values.region
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
#     Module      = "resource-group"
#   }
# }

# Usage Notes:
# - Run 'terragrunt plan' to see what changes will be made
# - Run 'terragrunt apply' to apply the changes
# - Run 'terragrunt destroy' to destroy the infrastructure
# - Terragrunt automatically handles state locking and unlocking
# - Use 'terragrunt output' to see outputs from this module
