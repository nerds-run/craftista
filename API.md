# Craftista API Documentation

## Overview

Craftista provides RESTful APIs across four microservices. All APIs return JSON responses and follow standard HTTP status codes.

## Base URLs

- Frontend: `http://localhost:3030`
- Catalogue: `http://localhost:5000`
- Voting: `http://localhost:8080`
- Recommendation: `http://localhost:8081`

## Common Endpoints

All services implement:

### Health Check
```
GET /health
```

Response:
```json
{
  "status": "healthy",
  "service": "service-name",
  "version": "1.0.0",
  "timestamp": "2025-06-27T00:00:00Z"
}
```

## Service-Specific APIs

### Frontend Service

#### Get Service Status
```
GET /api/service-status
```
Returns the status of all backend services.

Response:
```json
{
  "Catalogue": "up",
  "Voting": "up",
  "Recommendation": "up"
}
```

#### Get Recommendation Status
```
GET /recommendation-status
```
Proxies to recommendation service status.

#### Get Daily Origami
```
GET /api/daily-origami
```
Proxies to recommendation service for daily origami.

### Catalogue Service

#### List All Products
```
GET /api/products
```

Response:
```json
[
  {
    "id": 1,
    "name": "Paper Crane",
    "description": "Classic origami crane",
    "image": "crane.jpg",
    "category": "Traditional"
  }
]
```

#### Get Product by ID
```
GET /api/products/{id}
```

Response:
```json
{
  "id": 1,
  "name": "Paper Crane",
  "description": "Classic origami crane",
  "image": "crane.jpg",
  "category": "Traditional"
}
```

Status Codes:
- 200: Success
- 404: Product not found

### Voting Service

#### Get All Origamis with Votes
```
GET /api/origamis
```

Response:
```json
[
  {
    "origamiId": 1,
    "name": "Paper Crane",
    "votes": 42
  }
]
```

#### Get Origami by ID
```
GET /api/origamis/{id}
```

Response:
```json
{
  "origamiId": 1,
  "name": "Paper Crane",
  "votes": 42
}
```

#### Vote for Origami
```
POST /api/origamis/{id}/votes
```

Response:
```json
{
  "origamiId": 1,
  "name": "Paper Crane",
  "votes": 43
}
```

### Recommendation Service

#### Get Daily Origami Recommendation
```
GET /api/origami-of-the-day
```

Response:
```json
{
  "id": 3,
  "name": "Origami Dragon",
  "description": "A complex dragon design",
  "image": "dragon.jpg",
  "dateRecommended": "2025-06-27"
}
```

#### Get Service Status
```
GET /api/recommendation-status
```

Response:
```json
{
  "status": "up"
}
```

## Error Responses

All services return errors in a consistent format:

```json
{
  "error": {
    "code": "ERROR_CODE",
    "message": "Human-readable error message",
    "timestamp": "2025-06-27T00:00:00Z"
  }
}
```

Common error codes:
- `NOT_FOUND`: Resource not found
- `INVALID_REQUEST`: Bad request format
- `INTERNAL_ERROR`: Server error

## Status Codes

- 200: Success
- 201: Created
- 400: Bad Request
- 404: Not Found
- 500: Internal Server Error

## CORS

All services support CORS for browser-based access.

## Authentication

Currently, no authentication is required. This will be added in future versions.

## Rate Limiting

No rate limiting is currently implemented.

## Versioning

API version is included in health check responses. Future versions may include versioned endpoints.