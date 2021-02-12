variable "project" {
  description = "Name of GCP project"
  type        = string
}

variable "network" {
  description = "Authorized network allowed to communicate with redis instance"
  default     = "default"
  type        = string
}

variable "region" {
  description = "GCP region"
  default     = "europe-west3"
  type        = string
}

variable "zone" {
  description = "The zone where the instance will be provisioned. If not provided, the service will choose a zone for the instance"
  default     = null
  type        = string
}

variable "instance_name" {
  description = "Redis instances name"
  default     = "redis"
  type        = string
}

variable "display_name" {
  description = "Redis instances display name, if empty taken from instance_name"
  default     = ""
  type        = string
}

variable "tier" {
  description = "The service tier of the instance. Must be one of these values: BASIC, STANDARD_HA"
  default     = "BASIC"
  type        = string
}

variable "memory_size_gb" {
  description = "Redis memory size in GiB"
  default     = 1
  type        = number
}

variable "namespace" {
  default     = "production"
  description = "K8s namespace used to deploy endpoints and services"
  type        = string
}

variable "cluster_ca_certificate" {
  description = "Public CA certificate that is the root of trust for the GKE K8s cluster"
  type        = string
}

variable "cluster_token" {
  description = "Cluster master token, keep always secret!"
  type        = string
}

variable "cluster_endpoint" {
  description = "Cluster control plane endpoint"
  type        = string
}

variable "redis_version" {
  default     = "REDIS_4_0"
  description = "Redis instance version. Must be on of these values: REDIS_5_0, REDIS_4_0, REDIS_3_2"
  type        = string
}
