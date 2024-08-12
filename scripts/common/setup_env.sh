#!/bin/bash

ENVIRONMENT=$1

# Load environment variables based on the environment
case $ENVIRONMENT in
    dev)
        echo "Setting up environment for development..."
        export APP_ENV=development
        export GCP_PROJECT_ID=your-dev-project-id
        export GCP_REGION=us-central1
        ;;
    prod)
        echo "Setting up environment for production..."
        export APP_ENV=production
        export GCP_PROJECT_ID=your-prod-project-id
        export GCP_REGION=us-central1
        ;;
    local)
        echo "Setting up environment for local development..."
        export APP_ENV=local
        export GCP_PROJECT_ID=your-local-project-id
        export GCP_REGION=us-central1
        ;;
    *)
        echo "Invalid environment specified. Use 'dev', 'prod', or 'local'."
        exit 1
        ;;
esac
