# Craftista Helm Chart

This Helm chart deploys the Craftista microservices application on Kubernetes.

## Overview

Craftista is a polyglot microservices application for showcasing origami art with voting and recommendation features. The chart deploys:

- **Frontend Service** (Node.js/Express) - Main UI and service router
- **Catalogue Service** (Python/Flask) - Origami catalogue management
- **Voting Service** (Java/Spring Boot) - User voting functionality
- **Recommendation Service** (Go/Gin) - Daily origami recommendations
- **PostgreSQL** - Shared database for catalogue and voting services

## Prerequisites

- Kubernetes 1.19+
- Helm 3.8+
- PV provisioner support in the underlying infrastructure (optional)

## Installation

### Quick Start

```bash
# Add PostgreSQL image to avoid Docker Hub rate limits (for Kind/local clusters)
kind load docker-image postgres:16.2-alpine3.19 --name <cluster-name>

# Install with default values
helm install craftista ./craftista

# Install with specific environment values
helm install craftista-dev ./craftista -f values-dev.yaml
helm install craftista-test ./craftista -f values-test.yaml
helm install craftista-prod ./craftista -f values-prod.yaml
```

### Using Namespaces

```bash
# Development environment
helm install craftista-dev ./craftista \
  --namespace craftista-dev \
  --create-namespace \
  -f values-dev.yaml

# Test environment
helm install craftista-test ./craftista \
  --namespace craftista-test \
  --create-namespace \
  -f values-test.yaml

# Production environment
helm install craftista-prod ./craftista \
  --namespace craftista-prod \
  --create-namespace \
  -f values-prod.yaml
```

## Configuration

### Key Configuration Options

| Parameter | Description | Default |
|-----------|-------------|---------|
| `global.imageRegistry` | Global Docker image registry | `ghcr.io/nerds-run/craftista` |
| `frontend.service.type` | Frontend service type | `ClusterIP` |
| `frontend.service.nodePort` | NodePort for frontend (if type=NodePort) | `30030` |
| `frontend.ingress.enabled` | Enable ingress for frontend | `false` |
| `postgresql.enabled` | Enable PostgreSQL deployment | `true` |
| `postgresql.auth.postgresPassword` | PostgreSQL admin password | `postgres` |
| `networkPolicy.enabled` | Enable network policies | `false` |
| `serviceAccount.create` | Create service account | `true` |

### Environment-Specific Values

#### Development (`values-dev.yaml`)
- Frontend exposed via NodePort (30030)
- Minimal resource requests
- No persistence for PostgreSQL
- Single replica for all services

#### Test (`values-test.yaml`)
- Frontend via ClusterIP only
- Moderate resource requests
- No persistence for PostgreSQL
- Single replica for all services

#### Production (`values-prod.yaml`)
- Frontend with Ingress enabled
- Higher resource requests
- Autoscaling enabled for all services
- Multiple replicas
- Monitoring and network policies enabled

## Accessing the Application

### Development Environment (NodePort)
```bash
export NODE_PORT=$(kubectl get svc craftista-dev-frontend -o jsonpath="{.spec.ports[0].nodePort}")
export NODE_IP=$(kubectl get nodes -o jsonpath="{.items[0].status.addresses[0].address}")
echo "Access application at: http://$NODE_IP:$NODE_PORT"
```

### Test/Production Environment (Port Forward)
```bash
kubectl port-forward svc/craftista-frontend 3030:3030
echo "Access application at: http://localhost:3030"
```

### Production with Ingress
Configure your DNS to point to the ingress controller and access via the configured hostname.

## Architecture

### Service Communication
- Frontend service acts as the main router
- All backend services expose REST APIs
- Services communicate using Kubernetes DNS names
- PostgreSQL shared between catalogue and voting services

### Database Schema
- Two databases created automatically:
  - `catalogue` - Product catalogue data
  - `voting` - User votes data
- Both use `devops` user with configurable password

### Security Features
- Pod security contexts (non-root user)
- Service accounts for all pods
- Network policies (when enabled)
- Resource limits and requests

## Customization

### Using Custom Images
```yaml
# In your values file
frontend:
  image:
    repository: my-registry/craftista-frontend
    tag: v1.2.3
```

### Enabling Monitoring
```yaml
serviceMonitor:
  enabled: true
  interval: 30s
```

### Configuring Autoscaling
```yaml
frontend:
  autoscaling:
    enabled: true
    minReplicas: 2
    maxReplicas: 10
    targetCPUUtilizationPercentage: 70
```

## Troubleshooting

### Check Pod Status
```bash
kubectl get pods -l app.kubernetes.io/instance=craftista
```

### View Logs
```bash
# All services
kubectl logs -l app.kubernetes.io/instance=craftista --all-containers=true

# Specific service
kubectl logs -l app.kubernetes.io/component=frontend
```

### Database Connection Issues
```bash
# Check PostgreSQL pod
kubectl logs -l app.kubernetes.io/component=postgresql

# Verify database creation
kubectl exec -it <postgresql-pod> -- psql -U postgres -c "\l"
```

## Uninstallation

```bash
helm uninstall craftista
kubectl delete namespace craftista  # If using dedicated namespace
```

## Development

### Chart Structure
```
craftista/
├── Chart.yaml              # Chart metadata
├── values.yaml             # Default values
├── values-*.yaml           # Environment-specific values
├── templates/
│   ├── _helpers.tpl        # Template helpers
│   ├── _partials/          # Shared templates
│   │   ├── _configmap.tpl
│   │   ├── _deployment.tpl
│   │   ├── _hpa.tpl
│   │   ├── _networkpolicy.tpl
│   │   └── _service.tpl
│   ├── frontend/           # Frontend service templates
│   ├── catalogue/          # Catalogue service templates
│   ├── voting/             # Voting service templates
│   ├── recommendation/     # Recommendation service templates
│   └── postgresql/         # PostgreSQL templates
└── README.md               # This file
```

### Adding a New Service
1. Create a new directory under `templates/`
2. Add deployment, service, and configmap templates
3. Use the shared partials for consistency
4. Add configuration to `values.yaml`
5. Update environment-specific values files

## License

See the main project LICENSE file.