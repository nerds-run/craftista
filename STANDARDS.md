# Craftista Coding Standards and Conventions

This document outlines the coding standards and conventions for the Craftista project to ensure consistency across all services.

## Naming Conventions

### Services
- Use lowercase singular names: `frontend`, `catalogue`, `voting`, `recommendation`
- Maintain consistent spelling: always use "catalogue" (not "catalog")

### Configuration Keys
- **JSON Config Files**: Use camelCase for all keys
  ```json
  {
    "version": "1.0.0",
    "servicePort": 3000,
    "apiBaseUrl": "http://example.com"
  }
  ```

### Environment Variables
- Use UPPER_SNAKE_CASE for all environment variables
  ```bash
  PRODUCTS_API_BASE_URI=http://catalogue:5000
  DATABASE_HOST=postgresql
  SERVICE_PORT=3000
  ```

### API Endpoints
- Use kebab-case for URLs
- Follow RESTful conventions
  ```
  GET    /api/products          # List all
  GET    /api/products/{id}     # Get one
  POST   /api/products          # Create
  PUT    /api/products/{id}     # Update
  DELETE /api/products/{id}     # Delete
  GET    /health                # Health check
  ```

## Docker Standards

### Base Images
- Always specify exact versions
- Prefer Alpine Linux for smaller images
- Use official images from Docker Hub

```dockerfile
# Good
FROM node:20.11-alpine3.19

# Bad
FROM node:latest
```

### Security
- Always create and use non-root users
- Copy only necessary files
- Use multi-stage builds when appropriate

```dockerfile
# Create non-root user
RUN addgroup -g 1001 appgroup && \
    adduser -D -u 1001 -G appgroup appuser

# Switch to non-root user
USER appuser
```

## Configuration Management

### Standard Config Schema
All services should have a `config.json` with these minimum fields:
```json
{
  "version": "1.0.0",
  "serviceName": "catalogue",
  "servicePort": 5000,
  "environment": "development"
}
```

### Environment Variable Override Pattern
```javascript
// JavaScript/Node.js
const port = process.env.SERVICE_PORT || config.servicePort || 3000;

// Python
port = os.getenv('SERVICE_PORT', config.get('servicePort', 5000))

// Go
port := os.Getenv("SERVICE_PORT")
if port == "" {
    port = config.ServicePort
}
```

## Health Check Endpoints

All services MUST implement a `/health` endpoint that returns:
```json
{
  "status": "healthy",
  "service": "catalogue",
  "version": "1.0.0",
  "timestamp": "2025-06-26T10:00:00Z"
}
```

## Error Handling

### HTTP Error Responses
Use consistent error response format:
```json
{
  "error": {
    "code": "PRODUCT_NOT_FOUND",
    "message": "Product with ID 123 not found",
    "timestamp": "2025-06-26T10:00:00Z"
  }
}
```

### Status Codes
- 200: Success
- 201: Created
- 400: Bad Request
- 404: Not Found
- 500: Internal Server Error

## Testing Standards

### Test Coverage
- Minimum 70% code coverage for all services
- All API endpoints must have tests
- Include both positive and negative test cases

### Test Naming
Follow language conventions:
- JavaScript: Descriptive strings in describe/it blocks
- Python: `test_` prefix with descriptive names
- Java: descriptive method names with `@Test`
- Go: `Test` prefix with descriptive names

## Documentation

### Service README Template
Each service must have a README.md with:
1. Service description
2. Prerequisites
3. Installation instructions
4. Configuration options
5. API documentation
6. Testing instructions
7. Docker instructions

### Code Comments
- Write self-documenting code
- Comment complex logic
- Document all public APIs
- Remove TODO comments before merging

## Version Control

### Commit Messages
Follow conventional commits:
```
feat: add health check endpoint
fix: correct database connection timeout
docs: update API documentation
chore: update dependencies
```

### Branch Naming
- `feature/description`
- `fix/description`
- `docs/description`
- `chore/description`

## Dependencies

### Version Pinning
- Pin major versions for production stability
- Use exact versions in Docker images
- Document reasons for specific versions

### Security Updates
- Run security audits regularly
- Update vulnerable dependencies immediately
- Document security updates in CHANGELOG

## Port Assignments

Standard port assignments for local development:
- Frontend: 3030
- Catalogue: 5000  
- Voting: 8080
- Recommendation: 8080 (mapped to 8081 in Docker)
- PostgreSQL: 5432

## Database Conventions

### Naming
- Use lowercase with underscores for table/column names
- Use plural names for tables: `products`, `votes`
- Use `id` as primary key name

### Credentials
- Development: `devops/devops`
- Never commit production credentials
- Use secrets management for sensitive data