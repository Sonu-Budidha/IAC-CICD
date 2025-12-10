
#!/bin/bash

# Debugging: Print AWS credentials (optional, for troubleshooting)
echo "AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID"
echo "AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY"
echo "AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION"

# Log in to AWS ECR (using AWS CLI)
aws ecr get-login-password --region $AWS_DEFAULT_REGION | docker login --username AWS --password-stdin $IMAGE_URI

# Pull the latest Docker image from ECR
docker pull $IMAGE_URI

# Stop any existing container running with the same name (app)
docker stop app || true
docker rm app || true

# Run the new container
docker run -d -p 8080:8080 --name app $IMAGE_URI

