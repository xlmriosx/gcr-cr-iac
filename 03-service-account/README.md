# 03 - Service Account

This folder sets up the necessary IAM (Identity and Access Management) Service Account for our application deployments. 

## What this does
- Creates a dedicated Service Account named **Cloud Run Deployer**.
- Grants the Service Account multiple roles necessary for pushing images and deploying to Cloud Run:
  - `Cloud Build Editor`
  - `Cloud Build Service Account`
  - `Cloud Run Admin`
  - `Service Account User`
  - `Viewer`
- Automatically generates and downloads a JSON key file to this folder (`cloud-run-deployer-key.json`) that can be used to authenticate local tools or CI/CD pipelines.

## Usage
Run the following to provision the account and securely download your `.json` key locally:

```bash
tofu init
tofu apply
```
