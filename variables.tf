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
  description = "Zone of GCP project - optional parameter, if not set, the instances will be spread across the available zones"
  default     = null
  type        = string
}

variable "instance_name" {
  description = "Redis instances name"
  default     = "redis"
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

variable "cluster_user" {
  description = "Cluster master username, keep always secret!"
  type        = string
}

variable "cluster_password" {
  description = "Cluster master password, keep always secret!"
  type        = string
}

variable "cluster_endpoint" {
  description = "Cluster control plane endpoint"
  type        = string
}
