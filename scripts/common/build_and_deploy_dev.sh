#!/bin/bash

echo "Building and deploying to the development environment..."

# Set environment variables specific to development
source ./scripts/common/setup_env.sh dev

# Build the application
echo "Building the application..."
# Add your build commands here, e.g., `go build` for Go applications
go build -o my_app

# Deploy the application
echo "Deploying the application to the development environment..."
# Add your deployment commands here, e.g., pushing to a development server or cloud environment
gcloud app deploy --project=$GCP_PROJECT_ID --quiet
