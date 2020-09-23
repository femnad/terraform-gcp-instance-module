variable prefix {}

variable github_user {}

variable project {}

variable ssh_user {}

variable ssh_email {
  default = "user@host"
}

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
  default = "europe-west-1"
}

variable service_account_file {
  default = ""
}

variable zone {
  default = "europe-west1-c"
}
