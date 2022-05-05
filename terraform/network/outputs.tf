output "out_vpc_name" {
    value = google_compute_network.vpc_network.name
}

output "out_sub1_region" {
    value = google_compute_subnetwork.sub1.region
}

output "out_sub2_region" {
    value = google_compute_subnetwork.sub2.region
}

output "out_sub1_name" {
    value = google_compute_subnetwork.sub1.name
}

output "out_sub2_name" {
    value = google_compute_subnetwork.sub2.name
}

# output "router_ip" {
#   value = google_compute_router_nat.nat.nat_ips
# }