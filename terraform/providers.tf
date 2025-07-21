# providers.tf

provider "google" {
#credenciales ficticias hacia GCP personalmente las guardo en GCS 
  credentials = file("credenciales.json")
  region = "us-central1"
}
