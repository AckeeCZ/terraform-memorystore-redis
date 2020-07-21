output "google_redis_instance_hostname" {
  description = "Hostname or IP address of the exposed Redis endpoint used by clients to connect to the service"
  value       = google_redis_instance.redis.host
}

output "google_redis_instance_port" {
  description = "The port number of the exposed Redis endpoint"
  value       = google_redis_instance.redis.port
}
