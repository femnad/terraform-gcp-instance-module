data "http" "ipinfo" {
  url = "https://ipinfo.io/json"
}

data "http" "github" {
  url = format("https://api.github.com/users/%s/keys", var.github_user)
}

locals {
  ssh_format_spec = format("%s:%%s %s", var.ssh_user, var.ssh_email)
}

provider "google" {
  credentials = var.service_account_file
  project     = var.project
  region      = var.region
  zone = var.zone
}

resource "google_compute_network" "network" {
  name = "${var.prefix}-network"
}

resource "google_compute_firewall" "firewall-rule" {
  name = "${var.prefix}-ssh-allower"
  network = google_compute_network.network.name

  allow {
    protocol = "tcp"
    ports = ["22"]
  }
  source_ranges = [format("%s/32", jsondecode(data.http.ipinfo.body).ip)]
}

resource "google_compute_firewall" "public-traffic-rules" {
  name = "allow-public-traffic"
  network = google_compute_network.network.name

  dynamic "allow" {
    for_each = var.public_traffic_from

    content {
      protocol = allow.value
      ports = split(",", allow.key)
    }
  }

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_instance" "instance" {
  name = "${var.prefix}-instance"
  machine_type = var.machine_type
  allow_stopping_for_update = true

  metadata = {
    ssh-keys = join("\n", formatlist(local.ssh_format_spec, [for key in jsondecode(data.http.github.body): key.key]))
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

  scheduling {
    preemptible = var.preemptible
  }
}
