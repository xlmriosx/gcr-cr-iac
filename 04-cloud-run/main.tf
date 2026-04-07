# Ensures the Cloud Run API is enabled
resource "google_project_service" "cloud_run" {
  project            = var.project_id
  service            = "run.googleapis.com"
  disable_on_destroy = false
}

# Deploys the Cloud Run Service
resource "google_cloud_run_v2_service" "test_service" {
  name     = "test"
  location = var.region
  project  = var.project_id
  
  # Allow direct access to the service
  ingress = "INGRESS_TRAFFIC_ALL"

  template {
    scaling {
      # Set maximum number of instances to 4
      max_instance_count = 4
    }

    containers {
      image = "docker.io/bootdotdev/getting-started:latest"
      
      # Container port from 8080 to 80
      ports {
        container_port = 80
      }
    }
  }

  depends_on = [
    google_project_service.cloud_run
  ]
}

# Allow public access (unauthenticated) to the service
resource "google_cloud_run_v2_service_iam_member" "public_access" {
  project  = google_cloud_run_v2_service.test_service.project
  location = google_cloud_run_v2_service.test_service.location
  name     = google_cloud_run_v2_service.test_service.name
  role     = "roles/run.invoker"
  member   = "allUsers"
}
