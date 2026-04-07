# 05 - Cloud Run Notely

This folder contains the OpenTofu code to deploy the custom `notely` application from our private Google Artifact Registry.

## What this does
- Pulls the private `notely` Docker image you built and pushed to Artifact Registry (`02-artifact-registry`).
- Creates a Cloud Run service named `notely` with auto-scaling setup to a maximum of 4 instances.
- Pre-configures request-based billing (which is the default on Cloud Run without always-on CPU allocation).
- Makes the new `notely` web application accessible to the public internet securely.

## Usage
Run the following commands:
```bash
tofu init
tofu apply
```
