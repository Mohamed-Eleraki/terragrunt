resource "azurerm_container_app" "eraki_container_app" {
  name                         = "capp-${var.host_environment_short}-${var.function}-${var.region_short}-${var.resource_number}"
  container_app_environment_id = var.container_app_environment_id  # azurerm_container_app_environment.pepco_shared_container_environment.id
  resource_group_name          = var.resource_group_name  # azurerm_resource_group.pepco_foundation_we_rg.name
  revision_mode                = "Single"

  template {
    container {
      name   = var.container_name  # "frontend"
      image = var.image_uri  # "cregname.azurecr.io/reponame:imagetag"
      cpu    = "0.5"
      memory = "1Gi"

      env {
        name  = "var-example-env"
        value = "example-value"
      }

      volume_mounts {
        name = "frontend-volume"
        path = "/mnt/data"
      }
    }

    min_replicas = 1

    volume {
      name = "frontend-volume"
      storage_name = var.managed_environment_storage_name  #azurerm_container_app_environment_storage.pepco_shared_container_env_storage.name
      storage_type = "AzureFile"
    }
  }

  ingress {
    external_enabled = true
    target_port      = var.target_port  #80
    transport        = "auto"

    traffic_weight {
      latest_revision = true
      percentage      = 100
    }
  }

  identity {
    type = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.pepco_capp_managed_identity_reg.id]
  }
  registry {
    server = var.container_reg_login_server  # azurerm_container_registry.pepco_container_registry_we.login_server
    identity = azurerm_user_assigned_identity.eraki_capp_managed_identity_reg.id
  }


  # registry {
  #   server               = var.registry_server
  #   username             = var.registry_username
  #   password_secret_name = "registry-password"
  # }

  # secret {
  #   name  = "registry-password"
  #   value = var.registry_password
  # }

  tags = local.all_tags
}
