variable "project" {
  description = "Your GCP project id."
  default     = "woven-arcadia-274510"
}

variable "region" {
  description = "GCP region to deploy resources into."
  default     = "us-central1"
}

variable "zone" {
  description = "Zone to deploy vm into."
  default     = "us-central1-a"
}

variable "name" {
  description = "Your name (for naming resources)"
  default     = "gcp-poc-vm"
}

#variable "vm_ssh_pub_key" {
# description = "Public ssh key value - for vm access"
#}

variable "vm_username" {
  description = "Username for vm access"
  default     = "root"
}


