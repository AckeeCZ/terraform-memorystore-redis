provider "random" {
  version = "~> 3.1.0"
}

provider "google" {
  version = "~> 3.69.0"
}

provider "google-beta" {
  version = "~> 3.69.0"
}

provider "vault" {
  version = "~> 2.20.0"
}

provider "kubernetes" {
  version = "~> 2.2.0"
}

provider "helm" {
  version = "~> 2.1.0"
}

module "gke" {
  source            = "git::ssh://git@gitlab.ack.ee/Infra/terraform-gke-vpc.git?ref=v9.5.0"
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
  cluster_token          = module.gke.access_token
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
