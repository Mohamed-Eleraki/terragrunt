unit "resource-group" {
  source = "../modules/components/infra-team-templates/resource-group"
  path   = "resource-group"
  values = {
    host_environment_short = "d"
    region_short           = "we"
    sysrole                = "containerapps"
    region                 = "westeurope"
  }
}

unit "log-analytics" {
  source = "../modules/components/infra-team-templates/log-analytics"
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

unit "container-env" {
  source = "../modules/components/infra-team-templates/container-env"
  path   = "container-env"
  values = {
    host_environment_short = "d"
    region_short           = "we"
    sysrole                = "containerapps"
    resource_number        = 01
    workload_profile_name = "Consumption"
    workload_profile_type = "Consumption"
    workload_profile_minimum_count = 0
    workload_profile_maximum_count = 1
  }
}

unit "storage-account" {
  source = "../modules/components/infra-team-templates/storage-account"
  path   = "storage-account"
  values = {
    host_environment_short = "d"
    region_short           = "we"
    sysrole                = "containerapps"
    resource_number        = "01"
    region                 = "westeurope"
  }
}

unit "vnet-subnet" {
  source = "../modules/components/infra-team-templates/vnet-subnet"
  path   = "vnet-subnet"
  values = {
    host_environment_short = "d"
    region_short           = "we"
    sysrole                = "containerapps"
    resource_number        = "01"
    region                 = "westeurope"
    address_space          = ["10.0.0.0/16"]
    subnet_prefixes        = ["10.0.1.0/24"]
  }
}

unit "container-apps" {
  source = "../modules/components/infra-team-templates/container-apps"
  path   = "container-apps"
  values = {
    host_environment_short = "d"
    region_short           = "we"
    sysrole                = "frontend"
    resource_number        = 01
    # container_app_environment_id = "${unit.container-env.container_app_environment_id}"
    workload_profile_name = "Consumption"
    workload_profile_type = "Consumption"
    workload_profile_minimum_count = 0
    workload_profile_maximum_count = 1
    container_name = "frontend"
    container_image = "ghcr.io/houssemdellai/containerapps-album-frontend:v1"  # "nginx:latest"
    container_cpu = "0.25"
    container_memory = "0.5Gi"
    container_env_vars = {
      "frontend" = [
        {
          name  = "DB_HOST"
          value = "localhost"
        },
        {
          name  = "DB_PORT"
          value = "5432"
        }
      ]
    }
    container_scale_rule_name = "http-scaling"
    http_concurrent_requests = 10
    http_scale_rule_min_replicas = 0
    http_scale_rule_max_replicas = 1
    containerapp_volume_name = "myvolume"
    # containerapp_storage_name = "${unit.storage-account.storage_account_name}"
    container_external_enable = true  # true
    container_target_port = 3000
    container_transport = "http"
    container_latest_revision = true
    container_precentage = 100
    allowed_ips = ["163.116.174.113"]
  }
}
