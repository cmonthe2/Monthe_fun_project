#!/bin/bash

set -e

# Step 1: Run Terraform to create EKS Cluster
echo "Creating Kubernetes cluster with Terraform..."
terraform -chdir=terraform apply -auto-approve

# Step 2: Configure kubectl
echo "Configuring kubectl..."
aws eks update-kubeconfig --region us-east-2 --name weather-cluster

# Step 3: Install Jenkins
echo "Installing Jenkins..."
kubectl create namespace jenkins
helm install jenkins jenkins/jenkins -n jenkins \
  --set controller.service.type=LoadBalancer \
  --set controller.adminUser=admin \
  --set controller.adminPassword=admin123

# Wait for Jenkins to be accessible
echo "Waiting for Jenkins to be ready..."
kubectl wait --namespace jenkins \
  --for=condition=available deployment/jenkins --timeout=600s

# Step 4: Create Jenkins pipeline
echo "Creating Jenkins pipeline..."
# Add Jenkins job configuration via Jenkins CLI or manually (optional)

# Step 5: Trigger Jenkins pipeline
echo "Triggering Jenkins pipeline..."
# Trigger Jenkins pipeline with Jenkins CLI or webhook (optional)

echo "Deployment completed successfully."
