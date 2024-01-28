terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.6.0"
    }
  }
}

provider "google" {
  credentials = "/workspaces/codespaces-blank/authentication.json"
  project     = "zoomcamp-project-412605"
  region      = "southeast-asia1"
}

resource "google_storage_bucket" "zoomcamp-storage-bucket" {
  name          = "zoomcamp-project-412605-storage-bucket"
  location      = "asia-southeast1"
  force_destroy = true

lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}

resource "google_bigquery_dataset" "zoomcamp-dataset" {
  dataset_id = "zoomcamp-project-412605-zoomcamp-dataset"
  location   = "asia-southeast1"
}