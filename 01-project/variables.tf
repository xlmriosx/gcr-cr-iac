variable "project_name" {
  description = "The name of the GCP project to create"
  type        = string
  default     = "notely"
}

variable "billing_account" {
  description = "The alphanumeric ID of the billing account to associate with this project"
  type        = string
}

variable "org_id" {
  description = "The numeric ID of the organization to create the project in (optional)"
  type        = string
  default     = null
}

variable "folder_id" {
  description = "The numeric ID of the folder to create the project in (optional)"
  type        = string
  default     = null
}
