resource "kubernetes_deployment" "bee_brilliant_worker_prod" {
  metadata {
    name = "bee-brilliant-worker-prod"

    labels = {
      "app.kubernetes.io/component" = "worker"

      "app.kubernetes.io/instance" = "bee-brilliant"

      "app.kubernetes.io/managed-by" = "doozer"

      "app.kubernetes.io/name" = "game-webservice"

      env = "prod"

      game = "bee-brilliant"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        name = "bee-brilliant-worker-prod"
      }
    }

    template {
      metadata {
        labels = {
          name = "bee-brilliant-worker-prod"
        }
      }

      spec {
        container {
          name    = "worker"
          image   = "gcr.io/tactile-webservices/game-webservice:v1.180.0_34290"
          command = ["node", "./run-worker.js"]

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
            requests = {
              cpu = "75m"

              memory = "100M"
            }
          }

          liveness_probe {
            exec {
              command = ["./bin/worker-liveness-probe"]
            }

            initial_delay_seconds = 10
            period_seconds        = 10
          }
        }
      }
    }
  }
}

