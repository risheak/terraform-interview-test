
resource "random_id" "cluster_id" {
  byte_length = 4
}

resource "random_password" "password" {
  length = 16
}

resource "google_container_cluster" "default" {
  name = "${var.prefix}-gke-cluster-${random_id.cluster_id.hex}"
  location = "${var.region}"
  remove_default_node_pool = true
  initial_node_count = 1

  maintenance_policy {
    daily_maintenance_window {
      start_time = "05:00"
    }
  }
}

resource "google_container_node_pool" "default" {
  name = "${var.prefix}-gke-node-pool-${random_id.cluster_id.hex}"
  cluster = google_container_cluster.default.name
  location = "${var.region}"
  node_count = var.node_count

  node_config {
    machine_type = var.machine_type
  }
}