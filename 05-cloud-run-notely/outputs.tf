output "notely_service_url" {
  description = "The public URL to test the actually deployed Notely service"
  value       = google_cloud_run_v2_service.notely_service.uri
}
