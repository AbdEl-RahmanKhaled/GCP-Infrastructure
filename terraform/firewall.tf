resource "google_compute_firewall" "allow_ssh" {
  project     = var.project_name
  name        = "allow-ssh"
  network     = var.vpc_name
  direction = "INGRESS"
  source_ranges = [ "35.235.240.0/20" ]

  depends_on = [
    module.network
  ]
  
  allow {
    protocol  = "tcp"
    ports     = ["22"]
  }

}

# resource "google_compute_firewall" "deny_all" {
#   project     = var.project_name
#   name        = "deny-all"
#   network     = var.vpc_name
#   direction = "EGRESS"
#   source_ranges = [ var.sub1_cidr ]
  
#   deny {
#     protocol  = "all"
#   }

# }