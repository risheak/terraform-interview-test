data "google_client_config" "default" {}
provider "kubernetes" {
  host = module.k8s.endpoint
  token                  = data.google_client_config.default.access_token
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

module "bb" {
  source = "./../../modules/games/BB"
  env = var.env
  count = var.game_to_deploy == "bb" ? 1 : 0
}

module "bbb" {
  source = "./../../modules/games/BBB"
  env = var.env
  count = var.game_to_deploy == "bbb" ? 1 : 0
}
