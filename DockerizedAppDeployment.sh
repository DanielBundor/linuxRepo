#!/bin/bash
#
# Dockerized Application Deployment Script
#
# This script automates the deployment of a Dockerized application.

# Exit immediately on error
set -e

# Build the Docker image
docker build -t myapp:latest .

# Push the image to a container registry
docker push myregistry/myapp:latest

# Pull the latest image on the target server
ssh user@target-server "docker pull myregistry/myapp:latest"

# Stop and remove the old container (if running)
ssh user@target-server "docker stop myapp || true && docker rm myapp || true"

# Run the new container
ssh user@target-server "docker run -d --name myapp -p 80:80 myregistry/myapp:latest"

