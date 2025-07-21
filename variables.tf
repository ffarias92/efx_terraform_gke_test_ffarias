# variables.tf
variable "project_name" {
  description = "El nombre de visualización del proyecto GCP."
  type        = string
  default     = "efx-terraform-test-1-name-ffarias" 
}

variable "project_id" {
  description = "GCP project ID"
  type        = string
  default     = "efx-terraform-test-1-ffarias" 
}

variable "billing_account_id" {
  description = "Billing acount ID"
  type        = string
  #billing acount es de ejemplo, 
  default     = "$BILLING_ACCOUNT_EXAMPLE"
}
