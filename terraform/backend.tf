terraform {
  backend "gcs" {
    bucket  = "tf-state-iti"
    prefix  = "terraform/state"
  }
}