variable "gcp-credentials-filepath" {
  description = "Filepath of Google Cloud Credentials file"
  type = string
}

variable "region" {
  description = "GCP Region"
  type = string
}

variable "env" {
  description = "Project environment"
  type = string
}

variable "k8s-nodes-count" {
  description = "Number of nodes"
  type = number
}

variable "k8s-nodes-machine-type" {
  description = "Machine type for Kubernetes nodes"
  type = string
  default = "n1-standard-1"
}


variable "game_to_deploy" {
  description = "The name of the Game to deplpy"
  type = string
}
