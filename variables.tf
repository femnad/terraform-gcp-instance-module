variable github_user {}

variable project {}

variable ssh_user {}

variable image {
  default = "debian-cloud/debian-10"
}

variable machine_type {
  default = "e2-small"
}

variable preemptible {
  default = true
}

variable region {
  default = "europe-west-2"
}

variable service_account_file {
  default = ""
}

variable zone {
  default = "europe-west2-c"
}
