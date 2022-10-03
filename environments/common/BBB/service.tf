resource "kubernetes_service" "bee_brilliant_blast_prod" {
  metadata {
    name = "bee-brilliant-blast-prod"
  }

  spec {
    port {
      name        = "bee-brilliant-blast-prod"
      protocol    = "TCP"
      port        = 80
      target_port = "4000"
    }

    selector = {
      name = "bee-brilliant-blast-app-prod"
    }

    type = "NodePort"
  }
}

