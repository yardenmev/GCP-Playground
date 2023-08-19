provider "google"{
    project = var.project_id
    region  = var.region
    credentials = file(var.credentials)
}

terraform {
  backend "gcs" {
    bucket = "gcp-playground-yarden"
    prefix  = "terraform/state"
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}

data "google_client_config" "default" { }

provider "kubernetes" {
  host                   = "https://${module.gke.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(module.gke.ca_certificate)
}



resource "google_artifact_registry_repository" "my-repo" {
  location = var.region
  repository_id = "playground"
  description = "nginx-palyground-repo"
  format = "docker"
}