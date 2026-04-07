terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
  # Support OpenTofu / Terraform >= 1.5.0
  required_version = ">= 1.5.0"
}

provider "google" {
  # Provide credentials via environment variable GOOGLE_APPLICATION_CREDENTIALS
  # or by running `gcloud auth application-default login`
}

provider "random" {}
