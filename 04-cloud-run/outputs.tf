output "service_url" {
  description = "The public URL to test the deployed service"
  value       = google_cloud_run_v2_service.test_service.uri
}
