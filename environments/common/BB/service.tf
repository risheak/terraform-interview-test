resource "kubernetes_service" "bee_brilliant_prod" {
  metadata {
    name = "bee-brilliant-prod"
  }

  spec {
    port {
      name        = "bee-brilliant-prod"
      protocol    = "TCP"
      port        = 80
      target_port = "4000"
    }

    selector = {
      name = "bee-brilliant-app-prod"
    }

    type = "NodePort"
  }
}

