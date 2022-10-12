resource "google_compute_network" "vpc_network" {
  name = "${var.name}-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_firewall" "fw" {
  name    = "${var.name}-fw"
  network = google_compute_network.vcp_network.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = [var.your_ip]
  target_tags = ["http"]
}

resource "google_compute_subnetwork" "vm_subnet" {
  name          = "${var.name}-subnet"
  ip_cidr_range = "10.0.0.0/22"
  region        = var.region
  network       = google_compute_network.vpc_network.id
}

resource "google_service_account" "default" {
  account_id   = "${var.name}-vm-sa"
  display_name = "VM sa"
}

resource "google_compute_instance" "default" {
  name         = "${var.name}-vm"
  machine_type = "e2-micro"
  zone         = var.zone

  tags = ["http-server"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.vm_subnet.self_link

    # access_config {
    #   // public IP
    # }

  }
  metadata = {
    ssh-keys = "${var.vm_username}:${var.vm_ssh_pub_key}"
  }
  metadata_startup_script = file("sartup.sh")

  service_account {
    email  = google_service_account.default.email
    scopes = ["cloud-platform"]
  }
}
