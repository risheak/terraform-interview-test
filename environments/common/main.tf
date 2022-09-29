provider "kubernetes" {
  host = module.k8s.endpoint
  username = module.k8s.username
  password = module.k8s.password
  client_certificate = base64decode(module.k8s.client_certificate)
  client_key = base64decode(module.k8s.client_key)
  cluster_ca_certificate = base64decode(module.k8s.cluster_ca_certificate)
}

locals {
  prefix = "tctl-${var.env}"
}

module "k8s" {
  source = "./../../modules/k8s"
  prefix = local.prefix
  region = var.region
  machine_type = var.k8s-nodes-machine-type
}