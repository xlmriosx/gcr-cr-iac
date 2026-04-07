variable "project_id" {
  description = "The ID of the GCP project"
  type        = string
}

variable "region" {
  description = "The default region for the repository"
  type        = string
  default     = "us-central1"
}
