variable "github_user" {}

variable "ssh_user" {
  default = "null"
}

variable "image" {
  default = "debian-cloud/debian-11"
}

variable "machine_type" {
  default = "e2-small"
}

variable "preemptible" {
  default = true
}
