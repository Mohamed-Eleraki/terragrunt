resource "azurerm_resource_group" "eraki_function_we_rg" {  # Adjust the resource name as needed
  name     = "RG-${var.host_environment_short}-${var.region_short}-${var.function}-${var.resource_number}"  # This values will be passed from terragrunt
  location = var.region
  tags     = local.all_tags
}