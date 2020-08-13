# k8s code resources created mainly for git@github.com:AckeeCZ/goproxie.git compatibility

resource "kubernetes_stateful_set" "redis" {
  metadata {

    labels = {
      app      = "redis"
      instance = var.instance_name
    }

    namespace = var.namespace
    name      = "redis-${var.instance_name}"
  }

  spec {
    selector {
      match_labels = {
        external-app = "redis"
        instance     = var.instance_name

      }
    }

    service_name = "redis-${var.instance_name}"

    template {
      metadata {
        labels = {
          external-app = "redis"
          instance     = var.instance_name
        }
      }

      spec {
        container {
          name              = "redis-${var.instance_name}"
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
