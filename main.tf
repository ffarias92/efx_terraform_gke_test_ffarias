# main.tf

#recursos

resource "google_project" "terraform_project_1" {
  name        = var.project_name
  project_id  = var.project_id
  billing_account = var.billing_account_id
}

# Activacion de APIs

resource "google_project_service" "compute_api_enable" {
  project            = google_project.terraform_project_1.project_id
  service            = "compute.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "storage_api_enable" {
  project            = google_project.terraform_project_1.project_id
  service            = "storage.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "gke_api_enable" {
  project            = google_project.terraform_project_1.project_id
  service            = "container.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "resource_manager_api_enable" {
  project            = google_project.terraform_project_1.project_id
  service            = "cloudresourcemanager.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "logging_api_enable" {
  project            = google_project.terraform_project_1.project_id
  service            = "logging.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "monitoring_api_enable" {
  project            = google_project.terraform_project_1.project_id
  service            = "monitoring.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "service_usage_api_enable" {
  project            = google_project.terraform_project_1.project_id
  service            = "serviceusage.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "iam_api_enable" {
  project = google_project.terraform_project_1.project_id
  service = "iam.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "dns_api_enable" {
  project = google_project.terraform_project_1.project_id
  service = "dns.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "artifact_registry_api_enable" {
  project = google_project.terraform_project_1.project_id
  service = "artifactregistry.googleapis.com"
  disable_on_destroy = false
}



#outputs



output "nuevo_project_id" {
  description = "El ID único del proyecto de GCP recién creado."
  value       = google_project.terraform_project_1.project_id
}

output "nuevo_project_name" {
  description = "El nombre de visualización del proyecto de GCP recién creado."
  value       = google_project.terraform_project_1.name
}
