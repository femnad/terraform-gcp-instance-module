# terraform-gcp-instance-module

A module for lazy GCP instance creation via Terraform.

## Required Input Variables

* `github_user`: A GitHub user to lookup allowed SSH keys

## Optional Input Variables

* `attached_disks`: List of disks to attach, default empty, each item is an object with attributes `source` and `name`
* `image`: Image of the instance, default `fedora-cloud/fedora-cloud-38`
* `machine_type`: Instance type, default `e2-small`
* `metadata`: Metadata values
* `name`: Name of the instance, random if null
* `network_name`: Name of the instance's network, random if null
* `network_tier`: Network tier for the instance, default `STANDARD`
* `on_host_maintenance`: What to do during host maintenance, `MIGRATE` or `TERMINATE`, default `TERMINATE`
* `service_account_scopes`: List of service account scopes, default `["cloud-platform"]`
* `service_account`: Optional service account to associate with the instance
* `size`: Image size in GiB, default `10`
* `spot`: Is spot instance? default `true`
* `ssh_user`: A user name to set for authorized SSH keys, defaults to `github_user`
* `subnetwork_name`: Name of the instance's subnetwork, random if null
* `termination_action`: Instance termination action, `STOP` or `DELETE`, defaults to `DELETE`
