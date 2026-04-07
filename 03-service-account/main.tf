# Create the Service Account
resource "google_service_account" "cloud_run_deployer" {
  account_id   = "cloud-run-deployer"
  display_name = "Cloud Run Deployer"
  project      = var.project_id
}

# Grant multiple IAM roles to the Service Account
resource "google_project_iam_member" "deployer_roles" {
  for_each = toset([
    "roles/cloudbuild.builds.editor",  # Cloud Build Editor
    "roles/cloudbuild.builds.builder", # Cloud Build Service Account
    "roles/run.admin",                 # Cloud Run Admin
    "roles/iam.serviceAccountUser",    # Service Account User
    "roles/viewer"                     # Viewer
  ])

  project = var.project_id
  role    = each.key
  member  = "serviceAccount:${google_service_account.cloud_run_deployer.email}"
}

# Generate a JSON Key for the Service Account
resource "google_service_account_key" "deployer_key" {
  service_account_id = google_service_account.cloud_run_deployer.name
}

# Automatically download the JSON Key to your computer in the same folder
resource "local_file" "service_account_key" {
  content  = base64decode(google_service_account_key.deployer_key.private_key)
  filename = "${path.module}/cloud-run-deployer-key.json"
}
