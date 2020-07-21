provider "template" {
  version = "~> 2.1.2"
}

provider "tls" {
  version = "~> 2.1.1"
}

module "gke" {
  source            = "git::ssh://git@gitlab.ack.ee/Infra/terraform-gke-vpc.git?ref=v6.4.0"
  namespace         = var.namespace
  project           = var.project
  location          = var.zone
  vault_secret_path = var.vault_secret_path
  private           = false
  min_nodes         = 1
  max_nodes         = 1
  cluster_name      = "redis-service-test"
}

module "redis" {
  source = "../"

  project                = var.project
  namespace              = var.namespace
  cluster_ca_certificate = module.gke.cluster_ca_certificate
  cluster_user           = module.gke.cluster_username
  cluster_password       = module.gke.cluster_password
  cluster_endpoint       = module.gke.endpoint
}

variable "namespace" {
  default = "stage"
}

variable "project" {
}

variable "vault_secret_path" {
}

variable "region" {
  default = "europe-west3"
}

variable "zone" {
  default = "europe-west3-c"
}
