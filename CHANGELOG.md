# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).


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
