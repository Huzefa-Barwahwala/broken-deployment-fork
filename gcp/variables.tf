variable "project" {
    description = "Your GCP project id."
}

variable "region" {
    description = "GCP region to deploy resources into."
}

variable "zone" {
    description = "Zone to deploy vm into."
}

variable "name" {
    description = "Your name (for naming resources)"
}

variable "vm_ssh_pub_key" {
    description = "Public ssh key value - for vm access"
}

variable "vm_username" {
    description = "Username for vm access"
}
