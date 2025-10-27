#!/bin/bash

# Script to build and push a general Nginx image to Azure Container Registry

# Set variables
ACR_NAME="cregdcommonwe1"  # Replace with your actual ACR name from the stack
IMAGE_NAME="nginx-general"
TAG="latest"
RESOURCE_GROUP="RG-D-WE-Common-3"  # Replace with your actual resource group name

# Check if Docker is running
if ! docker info > /dev/null 2>&1; then
    echo "Docker is not running. Please start Docker and try again."
    exit 1
fi

# Check if az CLI is installed
if ! command -v az &> /dev/null; then
    echo "Azure CLI is not installed. Please install it and authenticate."
    exit 1
fi

# Login to Azure (assuming az CLI is installed and authenticated)
echo "Logging in to Azure..."
az login --use-device-code

# Login to ACR
echo "Logging in to Azure Container Registry..."
az acr login --name $ACR_NAME

# Build the Docker image for linux/amd64 platform
echo "Building Docker image for linux/amd64..."
docker build --platform linux/amd64 -t $ACR_NAME.azurecr.io/$IMAGE_NAME:$TAG .

# Push the image to ACR
echo "Pushing image to Azure Container Registry..."
docker push $ACR_NAME.azurecr.io/$IMAGE_NAME:$TAG

echo "Image pushed successfully: $ACR_NAME.azurecr.io/$IMAGE_NAME:$TAG"
