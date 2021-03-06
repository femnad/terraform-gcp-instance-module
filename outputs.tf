output "instance_ip_addr" {
  value = google_compute_instance.instance.network_interface[0].access_config[0].nat_ip
}

output "network_name" {
  value = google_compute_network.network.name
}

output "provisioner_ip" {
  value = jsondecode(data.http.ipinfo.body).ip
}
