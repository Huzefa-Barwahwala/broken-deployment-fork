resource "google_compute_network" "vpc_network" {
  name                    = "${var.name}-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "vm_subnet" {
  name          = "${var.name}-subnet"
  ip_cidr_range = "10.0.1.0/24"
  region        = var.region
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_firewall" "fw" {
  name    = "${var.name}-fw"
  network = google_compute_network.vpc_network.id

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  direction     = "INGRESS"
  source_ranges = ["0.0.0.0/0"]
  #target_tags   = ["http-server"]
}

/*
resource "google_service_account" "default" {
  account_id   = "${var.name}-vm-sa"
  display_name = "VM sa"
}
*/

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

  metadata_startup_script = file("startup.sh")

  network_interface {
    subnetwork = google_compute_subnetwork.vm_subnet.id

    access_config {
      #   // public IP
    }

  }
}
/*
metadata = {
    #    ssh-keys = "${var.vm_username}:${var.vm_ssh_pub_key}"
  }
  #metadata_startup_script = file("startup.sh")
}

  service_account {
    email  = google_service_account.default.email
    scopes = ["cloud-platform"]
  }
}
*/

// A variable for extracting the external IP address of the VM
output "Web-server-URL" {
  value = join("", ["http://", google_compute_instance.default.network_interface.0.access_config.0.nat_ip, ":80"])
}