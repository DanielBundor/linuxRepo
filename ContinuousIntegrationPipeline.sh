#!/bin/bash
#
# Continuous Integration Pipeline Script
#
# This script automates a CI/CD pipeline for a Node.js application.
# It includes steps for code linting, testing, building, and deployment.

# Exit immediately on error
set -e

# Step 1: Code linting
npm run lint

# Step 2: Run unit tests
npm test

# Step 3: Build the application
npm run build

# Step 4: Deploy to staging environment
rsync -avz --exclude 'node_modules' ./ user@staging-server:/path/to/staging

# Step 5: Run integration tests in the staging environment
ssh user@staging-server "cd /path/to/staging && npm run test:integration"

# Step 6: Deploy to production if tests pass
if [ $? -eq 0 ]; then
    rsync -avz --exclude 'node_modules' ./ user@production-server:/path/to/production
    ssh user@production-server "cd /path/to/production && systemctl restart myapp"
else
    echo "Integration tests failed. Deployment to production aborted."
fi

