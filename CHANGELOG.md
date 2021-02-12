# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [v3.0.0] - 2021-02-05
### Removed	
- Cluster master username, password	
### Added	
- Cluster master auth token

## [v2.0.1] - 2021-02-05
### Added
- Display name could be setup by `display_name` variable

## [v2.0.0] - 2021-02-05
### Changed
- Required Terraform version bumped to 0.13

## [v1.4.0] - 2020-09-21
### Removed
- Remove providers locking - this should be done in main module in infrastructure repo from now on.
- Remove executable permissions from `example/spinup_testing.sh` - it should never be run directly, but must be used with `source` cmd
### Added
- Add locking to `example/main.tf`

## [v1.3.0] - 2020-08-13
### Changed
- Do not disable Redis API when the module's instance is destroyed

## [v1.2.0] - 2020-08-13
### Changed
- Change K8s stateful set's name to contain `instance_name` postfix to support more Redis instances in one GCP project

## [v1.1.0] - 2020-08-12
### Added
- Redis version parameter

## [v1.0.0] - 2020-01-21
### Added
- Add redis terraform module
