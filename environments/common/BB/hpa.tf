resource "kubernetes_horizontal_pod_autoscaler" "bee_brilliant_app_prod" {
  metadata {
    name = "bee-brilliant-app-prod"
  }

  spec {
    scale_target_ref {
      kind        = "Deployment"
      name        = "bee-brilliant-app-prod"
      api_version = "apps/v1"
    }

    min_replicas                      = 1
    max_replicas                      = 80
    target_cpu_utilization_percentage = 90
  }
}

