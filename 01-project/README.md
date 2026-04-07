# 01 - Project Setup

This folder contains the OpenTofu code responsible for creating the foundation of our infrastructure: the Google Cloud Project.

## What this does
- Discovers your organization and billing details.
- Provisions a brand new Google Cloud Project with a globally unique ID.
- Enables essential base APIs required for further provisioning (e.g., IAM, Compute Engine, Cloud Resource Manager).

## Usage
Provide your billing account and optionally your Organization ID in a `terraform.tfvars` file, then run:

```bash
tofu init
tofu apply
```
