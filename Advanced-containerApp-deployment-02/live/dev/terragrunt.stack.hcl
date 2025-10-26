#####################################
# Common units for dev environment
#####################################
unit "common-resource-group" {
    source = "../../modules/components/foundation/common-resource-group"
    path = "common-resource-group"

    values = {
        host_environment_short = "D"
        function = "Common"
        resource_number = "03"
        region_short = "WE"
        region = "westeurope"
    }
}
unit "network" {
    source = "../../modules/components/foundation/network"
    path = "network"

    values = {
        host_environment_short = "d"
        function = "common"
        resource_number = "1"
        region_short = "we"
        region = "westeurope"
        log_analytics_retention = 30
    }
}
unit "container-reg" {
    source = "../../modules/components/foundation/container-reg"
    path = "container-reg"

    values = {
        host_environment_short = "d"
        function = "common"
        resource_number = "01"
        region_short = "we"
        region = "westeurope"
        log_analytics_retention = 30
    }
}

########################################
# Application units for dev environment
########################################
unit "app-resource-group" {
    source = "../../modules/components/infra-team/resource-group"
    path = "app-resource-group"

    values = {
        host_environment_short = "D"
        function = "Capp"
        resource_number = "02"
        region_short = "WE"
        region = "westeurope"
    }
}
unit "storage-account" {
    source = "../../modules/components/infra-team/storage-account"
    path = "storage-account"

    values = {
        host_environment_short = "d"
        function = "app"
        resource_number = "01"
        region_short = "we"
        region = "westeurope"
    }
}
unit "log-analytics" {
    source = "../../modules/components/infra-team/log-analytics"
    path = "log-analytics"

    values = {
        host_environment_short = "d"
        function = "app"
        resource_number = "01"
        region_short = "we"
        region = "westeurope"
    }
}
unit "container-env" {
    source = "../../modules/components/infra-team/container-env"
    path = "container-env"

    values = {
        host_environment_short = "d"
        function = "app"
        resource_number = "01"
        region_short = "we"
        region = "westeurope"
        log_analytics_retention = 30
    }
}
unit "container-app" {
    source = "../../modules/components/infra-team/container-apps"
    path = "container-apps"

    values = {
        host_environment_short = "d"
        function = "app1"
        resource_number = "01"
        region_short = "we"
        region = "westeurope"
        container_name = "myappcontainer"
        image_uri = "cregdcommonwe1.azurecr.io/nginx-general:latest"
        target_port = 80
    }
}
