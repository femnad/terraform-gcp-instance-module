# terraform-gcp-instance-module

A module for lazy GCP instance creation via Terraform.

## Required Input Variables

* `github_user`: A GitHub user to lookup allowed SSH keys

## Optional Input Variables

* `image`: Image of the instance, default `debian-cloud/debian-12`
* `machine_type`: Instance type, default `e2-small`
* `preemptible`: Instance is preemptible?, default `true`
* `service_account_scopes`: List of service account scopes, default `["cloud-platform"]`
* `service_account`: Optional service account to associate with the instance
* `size`: Image size in GiB, default `10`
* `ssh_user`: A user name to set for authorized SSH keys, defaults to `github_user`
