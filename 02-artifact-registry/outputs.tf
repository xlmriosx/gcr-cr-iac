output "repository_name" {
  description = "The full name of the Artifact Registry repository"
  value       = google_artifact_registry_repository.notely_repo.name
}

output "repository_url" {
  description = "The URL of the Artifact Registry repository"
  value       = "${var.region}-docker.pkg.dev/${var.project_id}/${google_artifact_registry_repository.notely_repo.repository_id}"
}
