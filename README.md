# GCP Infrastructure as Code (OpenTofu)

This repository contains OpenTofu (Terraform) manifests to bootstrap a Google Cloud Platform (GCP) project for deploying a Dockerized application using Cloud Run.

The infrastructure is broken down into modular steps:

1. [**01-project**](./01-project/): Creates the GCP Project and enables base APIs.
2. [**02-artifact-registry**](./02-artifact-registry/): Sets up the Google Artifact Registry for storing Docker images.
3. [**03-service-account**](./03-service-account/): Configures a specific Service Account with the required IAM roles to deploy the application and generates a JSON key.
4. [**04-cloud-run**](./04-cloud-run/): Deploys a test container image to Google Cloud Run, making it publicly accessible over the internet.

## Requirements
- [OpenTofu](https://opentofu.org/) (or Terraform)
- [Google Cloud CLI](https://cloud.google.com/sdk/gcloud) (`gcloud`)

## How to use
Navigate to each directory sequentially and logically apply the configuration:
```bash
tofu init
tofu apply
```
