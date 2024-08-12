#!/bin/bash

# Function to display usage
usage() {
    echo "Usage: $0 {aws|gcp|both}"
    exit 1
}

# Check if the correct number of arguments is provided
if [ "$#" -ne 1 ]; then
    usage
fi

# Clone the GoBlazer repository
echo "Cloning the GoBlazer repository..."
git clone https://github.com/yourusername/goblazer.git || {
    echo "Failed to clone the repository. Please check your network connection."
    exit 1
}

cd goblazer || {
    echo "Failed to change directory to goblazer."
    exit 1
}

# Make scripts executable
chmod +x scripts/goblazer

case $1 in
    aws)
        echo "Installing AWS version..."
        chmod +x scripts/aws/*.sh
        echo 'export PATH="$PATH:'$(pwd)'/scripts/aws"' >> ~/.bashrc
        ;;
    gcp)
        echo "Installing GCP version..."
        chmod +x scripts/gcp/*.sh
        echo 'export PATH="$PATH:'$(pwd)'/scripts/gcp"' >> ~/.bashrc
        ;;
    both)
        echo "Installing both AWS and GCP versions..."
        chmod +x scripts/aws/*.sh scripts/gcp/*.sh
        echo 'export PATH="$PATH:'$(pwd)'/scripts/aws:'$(pwd)'/scripts/gcp"' >> ~/.bashrc
        ;;
    *)
        usage
        ;;
esac

# Source the updated bash profile to apply the PATH changes
source ~/.bashrc

echo "GoBlazer installation complete! You can now use the 'goblazer' command."
