output "project_name" {
  description = "The name of the created GCP project"
  value       = google_project.notely_project.name
}

output "project_id" {
  description = "The globally unique ID of the created GCP project"
  value       = google_project.notely_project.project_id
}

output "project_number" {
  description = "The numeric identifier of the GCP project"
  value       = google_project.notely_project.number
}
