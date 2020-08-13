data "google_compute_network" "default" {
  name = var.network
}

resource "google_project_service" "redis" {
  project            = var.project
  service            = "redis.googleapis.com"
  disable_on_destroy = false
}

resource "google_redis_instance" "redis" {
  name               = var.instance_name
  memory_size_gb     = var.memory_size_gb
  location_id        = var.zone
  region             = var.region
  tier               = var.tier
  authorized_network = data.google_compute_network.default.id
  redis_version      = var.redis_version

  depends_on = [google_project_service.redis]
}
