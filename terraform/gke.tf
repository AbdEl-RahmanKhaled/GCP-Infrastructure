resource "google_container_cluster" "app_cluster" {
  name     = "app-cluster"
  location = "${var.sub1_region}-b"

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1
  network = var.vpc_name
  subnetwork = var.sub1_name

  private_cluster_config {
    enable_private_endpoint = true
    enable_private_nodes    = true
    master_ipv4_cidr_block  = "192.168.1.0/28"
  }

  master_authorized_networks_config {
    cidr_blocks {
      cidr_block = var.sub2_cidr
      display_name = "Management CIDR"
    }
  }

  ip_allocation_policy {

  }

  release_channel {
      channel = "REGULAR"
  }

  depends_on = [
    module.network
  ]
}

resource "google_container_node_pool" "app_cluster_linux_node_pool" {
  name           = "${google_container_cluster.app_cluster.name}-linux-node-pool"
  location       = google_container_cluster.app_cluster.location
  cluster        = google_container_cluster.app_cluster.name
  node_count     = 3

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  

  node_config {
    # preemptible  = true
    disk_size_gb = 32
    disk_type = "pd-standard"
    machine_type = "e2-small"
    image_type = "COS_CONTAINERD"

    service_account = google_service_account.gke_sa.email

    oauth_scopes = [
      "storage-ro",
      "logging-write",
      "monitoring"
    ]

    labels = {
      cluster = google_container_cluster.app_cluster.name
    }
  }
  upgrade_settings {
    max_surge       = 1
    max_unavailable = 0
  }
}
