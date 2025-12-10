#!/bin/bash
export AWS_DEFAULT_REGION=us-east-2
export AWS_REGION=us-east-2

echo "Logging in to ECR..."
sudo docker login -u AWS -p $(aws ecr get-login-password --region us-east-2) $IMAGE_URI

echo "Pulling latest image..."
docker pull $IMAGE_URI:latest

echo "Stopping old container (if running)..."
docker stop app || true
docker rm app || true

echo "Starting new container..."
docker run -d --name app -p 8080:8080 $IMAGE_URI:latest

echo "Deployment completed!"

