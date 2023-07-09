variable "github_user" {}

variable "ssh_user" {
  default = ""
}

variable "image" {
  default = "debian-cloud/debian-12"
}

variable "machine_type" {
  default = "e2-small"
}

variable "preemptible" {
  default = true
}

variable "size" {
  type = number
  default = 10
  description = "Image size in GiB"
}
