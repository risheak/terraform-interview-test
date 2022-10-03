resource "kubernetes_horizontal_pod_autoscaler" "bee_brilliant_blast_app_prod" {
  metadata {
    name = "bee-brilliant-blast-app-prod"
  }

  spec {
    scale_target_ref {
      kind        = "Deployment"
      name        = "bee-brilliant-blast-app-prod"
      api_version = "apps/v1"
    }

    min_replicas                      = 1
    max_replicas                      = 80
    target_cpu_utilization_percentage = 90
  }
}

