#!/bin/bash

# Clone the backend repository
if [ ! -d "./backend" ]; then
  echo "Cloning backend repository..."
  git clone https://github.com/cutegunseoro/backend.git backend
else
  echo "Backend repository already exists. Pulling latest changes..."
  cd backend && git pull && cd ..
fi

# Create a Dockerfile for the backend
cat > ./backend/Dockerfile <<EOF
FROM openjdk:17-jdk-slim
WORKDIR /app
COPY . /app
RUN ./gradlew bootJar || ./mvnw package
EXPOSE 8080
CMD ["java", "-jar", "build/libs/*.jar"]
EOF