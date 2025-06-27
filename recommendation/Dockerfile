# Use the official Go image based on Alpine Linux
# TODO: make the image smaller and use debian slim
FROM golang:1.20.10-alpine3.18

# Set the working directory inside the container
WORKDIR /app

# Copy the Go application code into the container
COPY . .

# Build the Go application
RUN go build -o app

# Create non-root user
RUN addgroup -g 1001 appgroup && \
    adduser -D -u 1001 -G appgroup appuser && \
    chown -R appuser:appgroup /app

# Switch to non-root user
USER appuser

# Expose port 8080 for the application
EXPOSE 8080

# Define the command to run the Go application
CMD ["./app"]
