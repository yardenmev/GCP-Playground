provider "google"{
    project = "gcp-devops-training-389818"
    region  = "us-central1"
    credentials = file("key.json")
}

terraform {
  backend "gcs" {
    bucket = "infa-deploy-yarden-staging"
    prefix = "terraform/state"
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