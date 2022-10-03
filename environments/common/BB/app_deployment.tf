resource "kubernetes_deployment" "bee_brilliant_app_prod" {
  metadata {
    name = "bee-brilliant-app-prod"

    labels = {
      "app.kubernetes.io/component" = "app"
      "app.kubernetes.io/instance" = "bee-brilliant"
      "app.kubernetes.io/managed-by" = "doozer"
      "app.kubernetes.io/name" = "game-webservice"
      env = "prod"
      game = "bee-brilliant"
    }
  }

  spec {
    selector {
      match_labels = {
        name = "bee-brilliant-app-prod"
      }
    }

    template {
      metadata {
        labels = {
          name = "bee-brilliant-app-prod"
        }
      }

      spec {
        container {
          name    = "webservice"
          image   = "gcr.io/tactile-webservices/game-webservice:v1.180.0_34290"
          command = ["node", "./run-app.js"]

          port {
            name           = "http"
            container_port = 4000
            protocol       = "TCP"
          }

          env {
            name = "DATADOG_AGENT_HOST_IP"

            value_from {
              field_ref {
                field_path = "status.hostIP"
              }
            }
          }

          env {
            name = "DD_AGENT_HOST"

            value_from {
              field_ref {
                field_path = "status.hostIP"
              }
            }
          }

          env {
            name = "DD_ENTITY_ID"

            value_from {
              field_ref {
                field_path = "metadata.uid"
              }
            }
          }

          env {
            name  = "DEPLOY_SIZE"
            value = "large"
          }

          env {
            name  = "FLAG_DISABLE_TOURNAMENT_GARBAGE_COLLECTION"
            value = "true"
          }

          env {
            name  = "GAME_NAME"
            value = "bee-brilliant"
          }

          env {
            name = "MONGODB_URL"

            value_from {
              secret_key_ref {
                name = "bee-brilliant-prod-10fede4223e0fb3d55de3d8f7e9efc79"
                key  = "MONGODB_URL"
              }
            }
          }

          env {
            name  = "NODE_ENV"
            value = "production"
          }

          env {
            name = "PERSONALIZED_FEATURES_REDIS_URL"

            value_from {
              secret_key_ref {
                name = "bee-brilliant-prod-10fede4223e0fb3d55de3d8f7e9efc79"
                key  = "PERSONALIZED_FEATURES_REDIS_URL"
              }
            }
          }

          env {
            name = "POD_NAME"

            value_from {
              field_ref {
                field_path = "metadata.name"
              }
            }
          }

          env {
            name = "REDIS_URL"

            value_from {
              secret_key_ref {
                name = "bee-brilliant-prod-10fede4223e0fb3d55de3d8f7e9efc79"
                key  = "REDIS_URL"
              }
            }
          }

          env {
            name = "USER_SEGMENTS_REDIS_URL"

            value_from {
              secret_key_ref {
                name = "bee-brilliant-prod-10fede4223e0fb3d55de3d8f7e9efc79"
                key  = "USER_SEGMENTS_REDIS_URL"
              }
            }
          }

          resources {
            limits = {
              memory = "1024M"
            }

            requests = {
              cpu = "400m"

              memory = "200M"
            }
          }

          liveness_probe {
            http_get {
              path = "/healthz?timeoutSeconds=30"
              port = "4000"
            }

            initial_delay_seconds = 10
            timeout_seconds       = 35
            period_seconds        = 40
          }

          readiness_probe {
            http_get {
              path = "/readiness?timeoutSeconds=30"
              port = "4000"
            }

            initial_delay_seconds = 10
            timeout_seconds       = 35
            period_seconds        = 40
          }
        }
      }
    }

    strategy {
      type = "RollingUpdate"

      rolling_update {
        max_surge = "25%"
      }
    }
  }
}
