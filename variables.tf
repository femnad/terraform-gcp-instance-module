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
  default = "e2-micro"
}

variable preemptible {
  default = true
}

variable public_traffic_from {
  default = {
  }
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
