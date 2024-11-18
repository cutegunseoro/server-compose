#!/bin/bash

# Exit on any error
set -e

# Load environment variables from .env file
if [ -f ".env" ]; then
  echo "Loading environment variables from .env file..."
  export $(grep -v '^#' .env | xargs)
else
  echo "Error: .env file not found!"
  exit 1
fi

# Check and install Docker if not installed
if ! [ -x "$(command -v docker)" ]; then
  echo "Installing Docker..."
  sudo apt-get update
  sudo apt-get install -y docker.io
else
  echo "Docker is already installed."
fi

# Check and install Docker Compose if not installed
if ! [ -x "$(command -v docker-compose)" ]; then
  echo "Installing Docker Compose..."
  sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose
else
  echo "Docker Compose is already installed."
fi

# update submodules
echo "Updating backend submodule..."
git submodule update --recursive --remote

# Spin up Docker Compose
echo "Starting Docker Compose..."
docker-compose run builder
docker-compose up --build