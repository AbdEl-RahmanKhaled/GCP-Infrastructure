resource "google_compute_subnetwork" "sub1" {
  name          = var.sub1_name
  ip_cidr_range = var.sub1_cidr
  region        = var.sub1_region
  network       = google_compute_network.vpc_network.id
  private_ip_google_access = true
}

resource "google_compute_subnetwork" "sub2" {
  name          = var.sub2_name
  ip_cidr_range = var.sub2_cidr
  region        = var.sub2_region
  network       = google_compute_network.vpc_network.id
  private_ip_google_access = true
}