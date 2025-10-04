# Terragrunt Configuration File for Dev Environment
# This file includes the root configuration and can override or add specific settings.
# Terragrunt is a thin wrapper for Terraform that provides extra tools for:
# - Keeping configurations DRY (Don't Repeat Yourself)
# - Working with multiple Terraform modules
# - Managing remote state
# - Locking state files
# - Generating Terraform code dynamically

# include Block
# The include block allows you to include configurations from parent directories.
# This enables hierarchical configuration inheritance.
# Here, we include the root.hcl file which contains shared configurations like remote_state.
include {
  path = "root.hcl"
}

# Additional Terragrunt Blocks (Commented for Reference)

# inputs Block
# The inputs block allows you to pass variables to child modules.
# This is useful for overriding default values or providing environment-specific configs.
# inputs = {
#   environment = "dev"
#   location    = "East US"
# }

# dependencies Block
# The dependencies block allows you to specify dependencies between modules.
# Terragrunt will ensure dependent modules are applied in the correct order.
# dependencies {
#   paths = ["../vpc", "../security-groups"]
# }

# terraform Block
# The terraform block allows you to override Terraform settings.
# This can include version constraints, required providers, etc.
# terraform {
#   extra_arguments "common_vars" {
#     commands = ["plan", "apply"]
#     arguments = [
#       "-var-file=../../common.tfvars"
#     ]
#   }
# }

# locals Block
# The locals block allows you to define local values that can be reused.
# Similar to Terraform locals, but at the Terragrunt level.
# locals {
#   common_tags = {
#     Environment = "dev"
#     Project     = "my-project"
#   }
# }

# Usage Notes:
# - Run 'terragrunt plan' to see what changes will be made
# - Run 'terragrunt apply' to apply the changes
# - Terragrunt automatically handles state locking and unlocking
# - Use 'terragrunt plan --all' to plan across multiple modules
# - Use 'terragrunt apply --all' to apply across multiple modules
