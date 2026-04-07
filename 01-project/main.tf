# Generate a random suffix for the project_id to ensure global uniqueness
resource "random_id" "project_id_suffix" {
  byte_length = 4
}

# Create the GCP Project
resource "google_project" "notely_project" {
  name       = var.project_name
  project_id = "${var.project_name}-${random_id.project_id_suffix.hex}"

  billing_account = var.billing_account
  org_id          = var.org_id
  folder_id       = var.folder_id
}

# Optionally enable common base APIs required for many GCP projects
resource "google_project_service" "base_apis" {
  for_each = toset([
    "compute.googleapis.com",              # Compute Engine
    "iam.googleapis.com",                  # Identity and Access Management
    "cloudresourcemanager.googleapis.com", # Cloud Resource Manager
    "cloudbilling.googleapis.com",         # Cloud Billing
  ])

  project = google_project.notely_project.project_id
  service = each.key

  disable_on_destroy = false
}
