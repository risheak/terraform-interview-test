terraform {
  backend "gcs" {
    bucket = "tactile-interview-terraform-state"
    prefix  = "risheak-chauhan"
    credentials = "./credentials.json"
  }
}

provider "google" {
  credentials = file("./credentials.json")
  project = "tactile-interview-tests"
  region = "europe-west1-b"
}

module "common" {
  source = "./../../common"

  gcp-credentials-filepath = "./credentials.json"
  region = "europe-west1-b"
  env = "test"

  k8s-nodes-machine-type = "n1-standard-1"
  k8s-nodes-count = 3
}
