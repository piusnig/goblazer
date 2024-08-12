#!/bin/bash

echo "Building and deploying to the production environment..."

# Set environment variables specific to production
source ./scripts/common/setup_env.sh prod

# Build the application
echo "Building the application..."
# Add your production build commands here
go build -o my_app

# Deploy the application
echo "Deploying the application to the production environment..."
# Add your production deployment commands here
gcloud app deploy --project=$GCP_PROJECT_ID --quiet
