# Use a Gradle image with JDK pre-installed
FROM gradle:7.6.0-jdk17

# Set the working directory inside the container
WORKDIR /app

# Copy source code and Gradle files into the container
COPY backend/ /app/

# Ensure the Gradle wrapper is executable
RUN chmod +x gradlew

# Run the Gradle build task
RUN ./gradlew clean bootJar --no-daemon
