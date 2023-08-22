# GCP DevOps Pipeline

Welcome to the GCP DevOps Pipeline with ArgoCD repository! This repository demonstrates a complete DevOps pipeline built on Google Cloud Platform (GCP) using various tools and services.

## Overview

This repository showcases a comprehensive DevOps pipeline using GCP services, Terraform, Jenkins, Google Kubernetes Engine (GKE), Google Artifact Registry, and ArgoCD. The pipeline follows the following steps:

1. **Infrastructure Setup with Terraform:**
   - Terraform scripts (`infrastructure/`) define the infrastructure as code.
   - A full GKE cluster and Google Artifact Registry repository are created.

2. **Containerized Web App with Nginx:**
   - The `webapp/` directory contains an Nginx-based web application.
   - This web app is tested, built, and uploaded to the Google Artifact Registry upon successful testing.

3. **Continuous Integration with Jenkins:**
   - The Jenkins pipeline (`Jenkinsfile`) automates the entire process.
   - Upon successful testing, the pipeline is triggered automatically by a developer's push.
   - The Jenkins server, running on a Jenkins client, orchestrates the pipeline.

4. **Continuous Deployment with ArgoCD:**
   - An ArgoCD instance watches the GitOps repository (`GitOps-repo/`) for changes.
   - Upon updates, ArgoCD applies the corresponding service and deployment configurations to the GKE cluster.

