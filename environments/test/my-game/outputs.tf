output "k8s_cluster_ca_certificate" {
  value = module.common.k8s_cluster_ca_certificate
}

output "k8s_cluster_username" {
  value = module.common.k8s_cluster_username
}

output "k8s_cluster_password" {
  value = module.common.k8s_cluster_password
  sensitive = true
}