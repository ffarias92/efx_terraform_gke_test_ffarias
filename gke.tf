#gke.tf

resource "google_container_cluster" "efx-gke-ffarias" {
  name               = "efx-gke-ffarias"
  location           = "us-central1"
  initial_node_count = 1  
  deletion_protection = false

  node_config {
    machine_type = "e2-micro"  
    disk_size_gb = 20  
    disk_type    = "pd-standard"
  }
}

# ejecutar en script CI/CD o manualmente :  gcloud container clusters get-credentials efx-gke-ffarias --region us-central1 --project efx-terraform-test-1-ffarias
