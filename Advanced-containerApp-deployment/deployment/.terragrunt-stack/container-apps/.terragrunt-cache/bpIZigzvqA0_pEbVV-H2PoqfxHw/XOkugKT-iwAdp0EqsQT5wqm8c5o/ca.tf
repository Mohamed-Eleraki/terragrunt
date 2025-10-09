resource "azurerm_container_app" "eraki_container_apps_we" {
  # for_each = var.containerapps
  # name                         = "capp-${var.host_environment_short}-frontend-${var.region_short}-01"
  name                         = "capp-${var.host_environment_short}-${var.sysrole}-${var.region_short}-${var.resource_number}"
  container_app_environment_id = var.container_app_environment_id
  resource_group_name          = var.resource_group_name
  #   location                     = data.azurerm_resource_group.eraki_containerApps_we1_rg_1001.location
  revision_mode = "Single"
  workload_profile_name = var.workload_profile_name
  template {
    container {
      name   = var.container-name
      image  = var.container-image
      cpu    = var.container-cpu
      memory = var.container-memory
      dynamic "env" {
        for_each = lookup(var.container-env-vars, var.container-name, [])
        content {
          name  = env.value.name
          value = env.value.value
        }
      }
    }

    http_scale_rule {
      name                = var.container_scale_rule_name
      concurrent_requests = var.http_concurrent_requests
    }
    min_replicas = var.http_scale_rule_min_replicas
    max_replicas = var.http_scale_rule_max_replicas

    dynamic "volume" {
      for_each = var.containerapp_storage_name != "" ? [1] : []
      content {
        name = var.containerapp_volume_name
        storage_name = var.containerapp_storage_name
        storage_type = "AzureFile"
      }
    }
  }

  ingress {
    external_enabled = var.container-external-enable
    target_port      = var.container-target-port
    transport        = var.container-transport

    traffic_weight {
      latest_revision = var.container-latest-revision
      percentage      = var.container-precentage
    }

    dynamic "ip_security_restriction" {
      for_each = var.allowed_ips
      content {
        name            = "allow-${ip_security_restriction.key}"
        ip_address_range = ip_security_restriction.value
        action           = "Allow"
      }
    }
  }
  tags = local.all_tags
}
