#!/bin/bash

# Function to display usage instructions
function usage() {
    echo "Usage: goblazer gcp app [dev|prod] [run|deploy|test] [app_name]"
    echo "Commands:"
    echo "  run              - Run the application locally in the specified environment"
    echo "  deploy           - Deploy the application to the specified environment"
    echo "  test             - Run tests for the application in the specified environment"
    echo ""
    echo "Options:"
    echo "  -r APP_NAME      - Specify the application name (required for all commands)"
}

# Check if the correct number of arguments is provided
if [ "$#" -lt 3 ]; then
    usage
    exit 1
fi

ENVIRONMENT=$1
COMMAND=$2
APP_NAME=$3

# Define actions based on the command
case $COMMAND in
    run)
        echo "Running $APP_NAME in the $ENVIRONMENT environment..."
        # Add command to run the application, e.g., starting a local server
        gcloud app browse --project=$GCP_PROJECT_ID
        ;;
    deploy)
        echo "Deploying $APP_NAME to the $ENVIRONMENT environment..."
        # Add command to deploy the application, e.g., deploying to Google Cloud Run or GKE
        gcloud app deploy --project=$GCP_PROJECT_ID --quiet
        ;;
    test)
        echo "Testing $APP_NAME in the $ENVIRONMENT environment..."
        # Add command to run tests, e.g., integration tests, unit tests
        gcloud app describe --project=$GCP_PROJECT_ID
        ;;
    *)
        usage
        exit 1
        ;;
esac
