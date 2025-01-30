terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
  
  backend "gcs" {
    bucket = "tp_note"
    prefix = "terraform/state"
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

# 🔹 Activer les APIs nécessaires
resource "google_project_service" "enable_services" {
  for_each = toset([
    "run.googleapis.com",             # Cloud Run
    "artifactregistry.googleapis.com", # Artifact Registry
    "cloudbuild.googleapis.com",       # Cloud Build
    "sqladmin.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "serviceusage.googleapis.com",
  ])
  service = each.key
}

# 🔹 Créer un repository Artifact Registry pour stocker l’image Docker
resource "google_artifact_registry_repository" "node_repo" {
  location      = var.region
  repository_id = "repo-tp-note"
  format        = "DOCKER"

  lifecycle {
    prevent_destroy = true
  }
}




resource "google_sql_database" "wordpress" {
  name     = "wordpress"
  instance = "main-instance"
}





resource "google_sql_user" "wordpress" {
  name     = "wordpress"
  instance = "main-instance"
  password = "ilovedevops"
}