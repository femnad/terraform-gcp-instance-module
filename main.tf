variable prefix {}

variable github_user {}

variable project {}

variable service_account_file {}

variable ssh_user {}

variable ssh_email {}

variable image {
  default = "debian-cloud/debian-10"
}

variable machine_type {
  default = "g1-small"
}

variable region {
  default = "europe-west-2"
}

variable zone {
  default = "europe-west2-c"
}

variable managed_zone {}

variable dns_name {}

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
  network = google_compute_network.network_of_interest.name

  allow {
    protocol = "tcp"
    ports = ["22"]
  }
  source_ranges = [format("%s/32", jsondecode(data.http.ipinfo.body).ip)]
}

resource "google_compute_instance" "instance" {
  name = "${var.prefix}-instance"
  machine_type = var.machine_type

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
}

resource "google_dns_record_set" "record-set" {
  name = var.dns_name
  type = "A"
  ttl  = 60

  managed_zone = var.managed_zone

  rrdatas = [google_compute_instance.instance.network_interface[0].access_config[0].nat_ip]
}
