# Enable Secret Manager API
resource "google_project_service" "secretmanager" {
  project            = var.project_id
  service            = "secretmanager.googleapis.com"
  disable_on_destroy = false
}

# Create the Secret
resource "google_secret_manager_secret" "db_password" {
  project   = var.project_id
  secret_id = "notely_db_password"
  
  replication {
    auto {}
  }

  depends_on = [
    google_project_service.secretmanager
  ]
}

# Add the secret version
resource "google_secret_manager_secret_version" "db_password_version" {
  secret      = google_secret_manager_secret.db_password.id
  secret_data = var.database_url
}

# Assign Secret Accessor role to the existing Cloud Run Deployer Service Account (from 03)
resource "google_project_iam_member" "secret_accessor" {
  project = var.project_id
  role    = "roles/secretmanager.secretAccessor"
  member  = "serviceAccount:cloud-run-deployer@${var.project_id}.iam.gserviceaccount.com"
}
