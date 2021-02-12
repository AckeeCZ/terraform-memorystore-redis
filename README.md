# Terraform Redis instance in Memorystore store with stateful set deployment to GKE

This module is here just cause we wanted to deploy Redis in Memorystore and create proxy pod for it to create simple
access for developers. Once everything is deployed, use [goproxie](https://github.com/AckeeCZ/goproxie) to forward traffic from a local machine. For
normal applications running in the GCP, use `google_redis_instance_hostname` from outputs.

## Usage

```hcl
module "redis" {
  source = "git::ssh://git@github.com:AckeeCZ/terraform-memorystore-redis.git"

  project                = var.project
  namespace              = var.namespace
  cluster_ca_certificate = module.gke.cluster_ca_certificate
  cluster_user           = module.gke.cluster_username
  cluster_password       = module.gke.cluster_password
  cluster_endpoint       = module.gke.endpoint
}
```

## Before you do anything in this module

Install pre-commit hooks by running following commands:

```shell script
brew install pre-commit terraform-docs
pre-commit install
```

## Example

Simple example on howto use this module could be found at folder `example`. Use `spinup_testing.sh` script to init
the environment.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13 |

## Providers

| Name | Version |
|------|---------|
| google | n/a |
| kubernetes | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cluster\_ca\_certificate | Public CA certificate that is the root of trust for the GKE K8s cluster | `string` | n/a | yes |
| cluster\_endpoint | Cluster control plane endpoint | `string` | n/a | yes |
| cluster\_token | Cluster master token, keep always secret! | `string` | n/a | yes |
| instance\_name | Redis instances name | `string` | `"redis"` | no |
| memory\_size\_gb | Redis memory size in GiB | `number` | `1` | no |
| namespace | K8s namespace used to deploy endpoints and services | `string` | `"production"` | no |
| network | Authorized network allowed to communicate with redis instance | `string` | `"default"` | no |
| project | Name of GCP project | `string` | n/a | yes |
| redis\_version | Redis instance version. Must be on of these values: REDIS\_5\_0, REDIS\_4\_0, REDIS\_3\_2 | `string` | `"REDIS_4_0"` | no |
| region | GCP region | `string` | `"europe-west3"` | no |
| tier | The service tier of the instance. Must be one of these values: BASIC, STANDARD\_HA | `string` | `"BASIC"` | no |
| zone | The zone where the instance will be provisioned. If not provided, the service will choose a zone for the instance | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| google\_redis\_instance\_hostname | Hostname or IP address of the exposed Redis endpoint used by clients to connect to the service |
| google\_redis\_instance\_port | The port number of the exposed Redis endpoint |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
