variable "github_user" {}

variable "ssh_user" {}

variable "image" {
  default = "debian-cloud/debian-11"
}

variable "machine_type" {
  default = "e2-small"
}

variable "preemptible" {
  default = true
}

variable "region" {
  default = "europe-west2"
}

variable "zone" {
  default = "europe-west2-c"
}
