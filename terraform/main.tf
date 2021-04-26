terraform {
  backend "gcs" {
    bucket = "playground-272019-tf-state"
    prefix = "example-gcp-terraform"
  }

  required_version = "~> 0.14"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.57.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }
  }
}

provider "google" {
  project = var.gcp_project
  region  = var.gcp_region
}

resource "random_string" "id" {
  length  = 8
  special = false
  upper   = false
}

resource "google_storage_bucket" "example_bucket" {
  name     = "experiment1-${random_string.id.result}"
  location = var.bucket_location
}
