# Frontend Service

Main UI and service router for the Craftista application.

## Description

The frontend service is a Node.js/Express.js application that serves as the main entry point for users. It provides the web interface and integrates all backend services to create a cohesive user experience.

## Prerequisites

- Node.js 20.x
- npm 10.x

## Installation

```bash
npm install
```

## Configuration

The service uses a `config.json` file with the following options:

```json
{
  "version": "1.0.0",
  "productsApiBaseUri": "http://catalogue:5000",
  "recommendationBaseUri": "http://recommendation:8080",
  "votingBaseUri": "http://voting:8080"
}
```

### Environment Variables

- `PORT`: Server port (default: 3030)
- `productsApiBaseUri`: Override catalogue service URL
- `recommendationBaseUri`: Override recommendation service URL
- `votingBaseUri`: Override voting service URL

## API Documentation

See [API.md](../API.md#frontend-service) for detailed endpoint documentation.

Key endpoints:
- `GET /health` - Health check
- `GET /api/service-status` - Backend service status
- `GET /api/origamis` - List origamis with voting data
- `GET /api/daily-origami` - Get today's recommendation

## Development

```bash
# Run in development mode with hot reload
npm run dev

# Run tests
npm test

# Run linter
npm run lint
```

## Testing

```bash
# Run all tests
npm test

# Run with coverage
npm run test:coverage
```

The frontend uses Mocha and Chai for testing. Tests include:
- Unit tests for route handlers
- Integration tests for service communication
- Error handling scenarios

## Docker

```bash
# Build image
docker build -t craftista-frontend:latest .

# Run container
docker run -p 3030:3030 craftista-frontend:latest
```

The Dockerfile uses multi-stage builds and runs as non-root user for security.

## Troubleshooting

### Service Connection Issues

If the frontend cannot connect to backend services:

1. Check service URLs in config.json or environment variables
2. Verify backend services are running
3. Check network connectivity between containers
4. Review logs: `docker logs <container-id>`

### Common Errors

- **ECONNREFUSED**: Backend service is not running or wrong URL
- **404 on static assets**: Check public directory structure
- **Template errors**: Verify views directory and EJS templates

## Architecture

The frontend follows MVC pattern:
- **Models**: Service integration layer
- **Views**: EJS templates
- **Controllers**: Route handlers

Key dependencies:
- Express.js: Web framework
- EJS: Template engine
- Axios: HTTP client for backend communication
- Morgan: HTTP request logger

## Security

- Runs as non-root user (UID 1001)
- Environment variables for sensitive configuration
- CORS headers configured
- Input validation on all routes

## Performance

- Static assets served with compression
- Template caching in production
- Connection pooling for backend requests

## Monitoring

- Health endpoint at `/health`
- Structured logging with Morgan
- Service status dashboard at `/api/service-status`