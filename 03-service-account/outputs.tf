output "service_account_email" {
  description = "The email of the created Service Account"
  value       = google_service_account.cloud_run_deployer.email
}

output "key_file_path" {
  description = "The path where the JSON key was saved"
  value       = local_file.service_account_key.filename
}
