# 06 - Secrets

This folder contains the OpenTofu code to deploy Google Cloud Secret Manager infrastructure.

## What this does
- Enables the Secret Manager API.
- Creates a new secret named `notely_db_password`.
- Adds your provided `database_url` as the latest secret version.
- Grants the `Secret Manager Secret Accessor` role (`roles/secretmanager.secretAccessor`) to the `cloud-run-deployer` service account that was created in step 03.

## Usage
Run the following commands:
```bash
tofu init
tofu apply -var="database_url=TU_URL_AQUI"
```
