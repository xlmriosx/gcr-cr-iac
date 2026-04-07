# Enable Cloud Build API
resource "google_project_service" "cloudbuild" {
  project            = var.project_id
  service            = "cloudbuild.googleapis.com"
  disable_on_destroy = false
}

# Enable Artifact Registry API
resource "google_project_service" "artifactregistry" {
  project            = var.project_id
  service            = "artifactregistry.googleapis.com"
  disable_on_destroy = false
}

# Create Artifact Registry Repository
resource "google_artifact_registry_repository" "notely_repo" {
  project       = var.project_id
  location      = var.region
  repository_id = "notely-ar-repo"
  description   = "Docker repository for Notely images"
  format        = "DOCKER"
  mode          = "STANDARD_REPOSITORY"

  # The API needs to be enabled before the repository can be created
  depends_on = [
    google_project_service.artifactregistry
  ]
}
