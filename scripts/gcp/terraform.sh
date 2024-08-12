#!/bin/bash

# Function to display usage instructions
function usage() {
    echo "Usage: goblazer gcp terraform [dev|prod] [plan|apply] [options]"
    echo "Commands:"
    echo "  plan             - Generate and show an execution plan"
    echo "  apply            - Apply the changes required to reach the desired state"
    echo ""
    echo "Options:"
    echo "  -t TARGET        - Specify a specific Terraform target"
}

# Check if the correct number of arguments is provided
if [ "$#" -lt 2 ]; then
    usage
    exit 1
fi

ENVIRONMENT=$1
COMMAND=$2
shift 2

# Define paths based on environment
case $ENVIRONMENT in
    dev)
        TFVARS_FILE="terraform/gcp/dev/main.tfvars"
        ;;
    prod)
        TFVARS_FILE="terraform/gcp/prod/main.tfvars"
        ;;
    *)
        usage
        exit 1
        ;;
esac

# Execute the command
case $COMMAND in
    plan)
        terraform plan -var-file=$TFVARS_FILE "$@"
        ;;
    apply)
        terraform apply -var-file=$TFVARS_FILE "$@"
        ;;
    *)
        usage
        ;;
esac
