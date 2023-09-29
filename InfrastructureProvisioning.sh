#!/bin/bash
#
# Infrastructure Provisioning Script using Terraform
#
# This script automates the provisioning of AWS infrastructure using Terraform.

# Exit immediately on error
set -e

# Initialize Terraform
terraform init

# Plan the infrastructure changes
terraform plan -out=tfplan

# Apply the changes (provision resources)
terraform apply tfplan

# Output infrastructure details
terraform output

# Clean up temporary files
rm -f tfplan

