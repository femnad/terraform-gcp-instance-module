# terraform-gcp-instance-module

A module for lazy GCP instance creation via Terraform.

## Required Input Variables

* `github_user`: A GitHub user to lookup allowed SSH keys
* `project`: A GCP project to user
* `ssh_user`: A user name to set for authorized SSH keys
