# Stage 1: Build the Spring Boot application
FROM maven:3.9.5-eclipse-temurin-17 AS build

# Set the working directory inside the container
WORKDIR /app

# Copy the project's POM file for dependency resolution
COPY . .

# Build the application using Maven
RUN mvn clean package -DskipTests

# Stage 2: Create a smaller image for production
FROM eclipse-temurin:17-jre-jammy

# Set the working directory inside the container
WORKDIR /app

# Copy the JAR file built in the previous stage
COPY --from=build /app/target/voting-0.0.1-SNAPSHOT.jar app.jar

# Create non-root user
RUN groupadd -g 1001 appgroup && \
    useradd -u 1001 -g appgroup appuser && \
    chown -R appuser:appgroup /app

# Switch to non-root user
USER appuser

# Expose port 8080 for the Spring Boot application
EXPOSE 8080

# Define the command to run the Spring Boot application
CMD ["java", "-jar", "app.jar"]
