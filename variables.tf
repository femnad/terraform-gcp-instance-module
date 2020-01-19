variable prefix {}

variable github_user {}

variable project {}

variable service_account_file {}

variable ssh_user {}

variable ssh_email {
  default = "user@host"
}

variable image {
  default = "debian-cloud/debian-10"
}

variable machine_type {
  default = "g1-small"
}

variable public_traffic_from {
  default = {
    "" = "icmp"
  }
}

variable region {
  default = "europe-west-2"
}

variable zone {
  default = "europe-west2-c"
}
