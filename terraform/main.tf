module "network" {
    source = "./network"

    project_name = var.project_name
    vpc_name = var.vpc_name
    sub1_region = var.sub1_region
    sub2_region = var.sub2_region
    sub1_name = var.sub1_name
    sub2_name = var.sub2_name
    sub1_cidr = var.sub1_cidr
    sub2_cidr = var.sub2_cidr
}