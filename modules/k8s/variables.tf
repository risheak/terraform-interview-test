variable "prefix" {
  description = "Resource name prefix"
  type = string
}

variable "region" {
  description = "Google Cloud Platform Region"
  type = string
}

variable "username" {
  description = "Username to connect to K8s Cluster"
  type = string
  default = "admin"
}

variable "machine_type" {
  description = "Machine type to use"
  type = string
  default = "n1-standard-1"
}

variable "node_count" {
  description = "Default number of node"
  type = number
  default = 1
}
