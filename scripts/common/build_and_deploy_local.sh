#!/bin/bash

echo "Building and deploying to the local environment..."

# Set environment variables for local development
source ./scripts/common/setup_env.sh local

# Build the application
echo "Building the application for local development..."
# Add your local build commands here
go build -o my_app

# Run the application locally
echo "Running the application locally..."
# Add your commands to run the application locally
./my_app
