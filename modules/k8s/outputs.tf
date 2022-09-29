output "endpoint" {
  value = google_container_cluster.default.endpoint
}

output "cluster_name" {
  value = google_container_cluster.default.name
}

output "client_certificate" {
  value = google_container_cluster.default.master_auth[0].client_certificate
}

output "client_key" {
  value = google_container_cluster.default.master_auth[0].client_key
}

output "cluster_ca_certificate" {
  value = google_container_cluster.default.master_auth[0].cluster_ca_certificate
}

output "username" {
  value = var.username
}

output "password" {
  value = random_password.password.result
}