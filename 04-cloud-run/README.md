# 04 - Cloud Run

This folder contains the OpenTofu configuration to deploy a web application to Google Cloud Run. This is used to test our deployment strategy before pushing the actual `notely` application.

## What this does
- Enables the Cloud Run API (`run.googleapis.com`).
- Deploys the `bootdotdev/getting-started` Docker image to a Cloud Run service named `test`.
- Configures the service to scale up to 4 instances.
- Sets the container port to 80.
- Applies an IAM policy allowing unauthenticated external traffic and users to access the web server over the internet.

## Usage
Run the following commands to deploy the service:

```bash
tofu init
tofu apply
```

When finished, OpenTofu will output the public URL of the deployed container which you can visit in your browser.
