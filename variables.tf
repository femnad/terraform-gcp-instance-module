variable "github_user" {
  type = string
  description = "A GitHub user to lookup allowed SSH keys"
}

variable "ssh_user" {
  type = string
  default = ""
  description = "A user name to set for authorized SSH keys, defaults to `github_user`"
}

variable "image" {
  type = string
  default = "debian-cloud/debian-12"
  description = "Image of the instance"
}

variable "machine_type" {
  type = string
  default = "e2-small"
  description = "Instance type"
}

variable "preemptible" {
  type = bool
  default = true
  description = "Instance is preemptible?"
}

variable "size" {
  type        = number
  default     = 10
  description = "Image size in GiB"
}

variable "service_account" {
  type        = string
  default     = null
  description = "Optional service account to associate with the instance"
}

variable "service_account_scopes" {
  type        = list(string)
  default     = ["cloud-platform"]
  description = "List of service account scopes"
}
