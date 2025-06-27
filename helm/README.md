# Craftista Helm Charts

This directory contains the Helm chart for deploying the Craftista microservices application.

## Quick Start

```bash
# Install using Task (recommended)
task helm:install:dev    # Deploy to development environment
task helm:install:test   # Deploy to test environment  
task helm:install:prod   # Deploy to production environment

# Or use Helm directly
helm install craftista ./craftista -f craftista/values-dev.yaml
```

## Directory Structure

```
helm/
├── README.md           # This file
├── Taskfile.yaml       # Task automation for Helm operations
└── craftista/          # The Craftista Helm chart
    ├── Chart.yaml      # Chart metadata
    ├── README.md       # Detailed chart documentation
    ├── values.yaml     # Default configuration values
    ├── values-*.yaml   # Environment-specific values
    └── templates/      # Kubernetes resource templates
```

## Available Tasks

Run `task helm:help` to see all available Helm-related tasks:

- **Installation**: `install:dev`, `install:test`, `install:prod`
- **Upgrades**: `upgrade:dev`, `upgrade:test`, `upgrade:prod`
- **Management**: `list`, `status`, `uninstall`
- **Debugging**: `dry-run`, `debug`, `get-values`, `get-manifest`
- **Utilities**: `lint`, `template`, `package`

## Environments

The chart supports three pre-configured environments:

| Environment | Namespace | Values File | Purpose |
|-------------|-----------|-------------|---------|
| Development | craftista-dev | values-dev.yaml | Local development with NodePort access |
| Test | craftista-test | values-test.yaml | Integration testing environment |
| Production | craftista-prod | values-prod.yaml | Production with HA and monitoring |

## For Developers

See the [chart README](craftista/README.md) for detailed configuration options and customization instructions.

## Version Management

The chart version is managed in `craftista/Chart.yaml`. When making changes:

1. Update the `version` field for chart changes
2. Update the `appVersion` field when updating application versions
3. Document changes in the chart's README

## Contributing

When modifying the Helm chart:

1. Use the shared templates in `_partials/` for consistency
2. Update values documentation in the chart README
3. Test with `task helm:lint` before committing
4. Verify deployment with `task helm:dry-run`