#!/bin/bash

# Clone the DB repository
if [ ! -d "./db" ]; then
  echo "Cloning DB repository..."
  git clone https://github.com/cutegunseoro/db.git db
else
  echo "DB repository already exists. Pulling latest changes..."
  cd db && git pull && cd ..
fi

# Ensure SQL scripts are in the correct location
if [ ! "$(ls -A ./db)" ]; then
  echo "No migration files found in the DB repository!"
  exit 1
fi