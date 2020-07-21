# k8s code resources created mainly for git@github.com:AckeeCZ/goproxie.git compatibility

resource "kubernetes_stateful_set" "redis" {
  metadata {

    labels = {
      app = "redis"
    }

    namespace = var.namespace
    name      = "redis"
  }

  spec {
    selector {
      match_labels = {
        external-app = "redis"
      }
    }

    service_name = "redis"

    template {
      metadata {
        labels = {
          external-app = "redis"
        }
      }

      spec {
        container {
          name              = "redis"
          image             = "alpine/socat"
          image_pull_policy = "IfNotPresent"

          args = [
            "tcp-listen:6379,fork,reuseaddr",
            "tcp-connect:${google_redis_instance.redis.host}:${google_redis_instance.redis.port}",
          ]
          port {
            protocol       = "TCP"
            container_port = 6379
            host_port      = 6379
          }
          resources {
            limits {
              cpu    = "100m"
              memory = "100Mi"
            }
            requests {
              cpu    = "10m"
              memory = "10Mi"
            }
          }
        }
        termination_grace_period_seconds = 1
      }
    }
    update_strategy {
      type = "RollingUpdate"
      rolling_update {
        partition = 0
      }
    }
  }
}
