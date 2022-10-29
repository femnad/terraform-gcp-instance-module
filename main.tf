data "http" "github" {
  url = format("https://api.github.com/users/%s/keys", var.github_user)
}

locals {
  ssh_format_spec = format("%s:%%s %s@host", var.ssh_user, var.ssh_user)
}

provider "google" {
  credentials = var.service_account_file
  project     = var.project
  region      = var.region
  zone        = var.zone
}

resource "random_pet" "prefix" {
}

resource "google_compute_network" "network" {
  name                    = "${random_pet.prefix.id}-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnetwork" {
  name          = "${random_pet.prefix.id}-subnetwork"
  network       = google_compute_network.network.name
  region        = var.region
  ip_cidr_range = "10.1.0.0/24"
}

resource "google_compute_instance" "instance" {
  name                      = "${random_pet.prefix.id}-instance"
  machine_type              = var.machine_type
  allow_stopping_for_update = true

  metadata = {
    ssh-keys = join("\n", formatlist(local.ssh_format_spec, [for key in jsondecode(data.http.github.body) : key.key]))
  }

  network_interface {
    network = google_compute_network.network.name
    access_config {}
  }

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  lifecycle {
    ignore_changes = [attached_disk]
  }

  scheduling {
    preemptible       = var.preemptible
    automatic_restart = !var.preemptible
  }
}
