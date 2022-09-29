terraform {
  backend "gcs" {
    bucket = "tactile-interview-terraform-state"
    prefix  = "john-doe"
    credentials = "./credentials.json"
  }
}

provider "google" {
  credentials = file("./credentials.json")
  project = "tactile-interview-tests"
  region = "europe-west1"
}

module "common" {
  source = "./../common"

  gcp-credentials-filepath = "./credentials.json"
  region = "europe-west1"
  zone = "europe-west1-c"
  env = "prod"

  k8s-nodes-machine-type = "n1-standard-1"
  k8s-nodes-count = 3
}