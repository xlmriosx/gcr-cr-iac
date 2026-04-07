# 02 - Artifact Registry

This folder contains the OpenTofu manifests to configure a private Docker image registry within Google Cloud Platform.

## What this does
- Enables the Cloud Build API.
- Enables the Artifact Registry API.
- Creates a Docker-formatted standard Artifact Registry repository named `notely-ar-repo` in the `us-central1` region. This is where we will push our application container images before deploying them.

## Usage
Ensure your `project_id` variable is correct inside `terraform.tfvars`, then run:

```bash
tofu init
tofu apply
```
