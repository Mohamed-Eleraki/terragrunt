# using Capp-module 
module "Capp-module" {
  source = "../../../modules/Capp-module"
  # source                    = "${path.module}/../../modules/Capp-module"
  region                    = local.region
  host_environment_short    = local.host_environment_short
  region_short              = local.region_short
  sysrole                   = var.sysrole
  resource_number           = var.resource_number
  retention_in_days         = var.retention_in_days
  container-name            = var.container-name
  container-image           = var.container-image
  container-cpu             = var.container-cpu
  container-memory          = var.container-memory
  container-env-vars        = var.container-env-vars
  container-external-enable = var.container-external-enable
  container-target-port     = var.container-target-port
  container-transport       = var.container-transport
  container-latest-revision = var.container-latest-revision
  container-precentage      = var.container-precentage
}
