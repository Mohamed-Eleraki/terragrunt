remote_state {
  backend = "azurerm"
  config = {
    subscription_id      = "REPLACE_WITH_YOUR_SUBSCRIPTION_ID"
    resource_group_name  = "REPLACE_WITH_YOUR_RESOURCE_GROUP_NAME"
    storage_account_name = "REPLACE_WITH_YOUR_STR_ACC_NAME"
    container_name       = "REPLACE_WITH_YOUR_STR_ACC_CONTAINER_NAME"
    key                  = "${path_relative_to_include()}/terragrunt.tfstate"
  }
}

# include {
#   path = find_in_parent_folders("root.hcl")
# }

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite"
  contents  = <<EOF
provider "azurerm" {
  features {}
  subscription_id = "REPLACE_WITH_YOUR_SUBSCRIPTION_ID"
}
terraform {
  backend "azurerm" {}
}
EOF
}
