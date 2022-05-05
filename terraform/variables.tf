variable "project_name" {
  type = string
  description = "Project name"
}

variable "vpc_name" {
  type = string  
}

variable "sub1_region" {
  type = string
  description = "Subnet 1 region"
}

variable "sub2_region" {
  type = string
  description = "Subnet 2 region"
}

variable "sub1_name" {
  type = string
  description = "Subnet 1 name"
}

variable "sub2_name" {
  type = string
  description = "Subnet 2 name"
}

variable "sub1_cidr" {
  type = string
  description = "Subnet 1 CIDR block"
}

variable "sub2_cidr" {
  type = string
  description = "Subnet 2 CIDR block"
}