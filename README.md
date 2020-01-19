# terraform-gcp-instance-module

A module for lazy GCP instance creation via Terraform.

## Required Input Variables

* `github_user`: A GitHub user to lookup allowed SSH keys
* `prefix`: A prefix for the created resources
* `project`: A GCP project to user
* `service_account_file`: A credentials file for a service account 
* `ssh_user`: A user name to set for authorized SSH keys
