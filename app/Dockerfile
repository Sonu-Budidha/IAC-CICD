# Use Python 3.9 slim base image
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Copy dependency list first
COPY requirements.txt .

# Install dependencies
RUN pip install -r requirements.txt

# Copy the rest of the app
COPY . .

# Expose port 8080
EXPOSE 8080

# Start the application
CMD ["python", "app.py"]

