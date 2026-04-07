# Ensures the Cloud Run API is enabled
resource "google_project_service" "cloud_run" {
  project            = var.project_id
  service            = "run.googleapis.com"
  disable_on_destroy = false
}

# Deploys the main Notely Cloud Run Service
resource "google_cloud_run_v2_service" "notely_service" {
  name     = "notely"
  location = var.region
  project  = var.project_id
  
  # Allow direct access to the service (Ingress: All)
  ingress = "INGRESS_TRAFFIC_ALL"

  template {
    # Usar tu service account dedicado de despliegues
    service_account = "cloud-run-deployer@${var.project_id}.iam.gserviceaccount.com"
    
    scaling {
      # Set maximum number of instances to 4 (Auto scaling is implicit)
      max_instance_count = 4
    }

    containers {
      # Pulls the image from the private Artifact Registry we created in 02
      image = "${var.region}-docker.pkg.dev/${var.project_id}/notely-ar-repo/notely:latest"

      # Cargar la Password de base de datos desde Secret Manager (creada en el Modulo 06)
      env {
        name = "DATABASE_URL"
        value_source {
          secret_key_ref {
            secret  = "notely_db_password"
            version = "latest"
          }
        }
      }
    }
  }

  depends_on = [
    google_project_service.cloud_run
  ]
}

# Authentication: Allow public access
resource "google_cloud_run_v2_service_iam_member" "public_access" {
  project  = google_cloud_run_v2_service.notely_service.project
  location = google_cloud_run_v2_service.notely_service.location
  name     = google_cloud_run_v2_service.notely_service.name
  role     = "roles/run.invoker"
  member   = "allUsers"
}
