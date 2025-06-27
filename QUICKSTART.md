# Nerds Craftista Quick Start Guide

## 🚀 Fastest Way to Run Nerds Craftista

### Things that need to be completed

**should be fixed**
--testing argocd--

Need to remove the github personal access token requirement. The main thing that needs to be changed is the OCI images need to
be public and accessible to everyone. As time permits I will get this done.

### Prerequisites
- Docker and Docker Compose installed
- GitHub Personal Access Token (PAT) with package permissions
- Task installed (`brew install go-task/tap/go-task` or see https://taskfile.dev)

### Start in 3 Steps

```bash
# 1. Set your GitHub token
export CR_PAT=your_github_personal_access_token

# 2. Login to registry
task docker:login GITHUB_USERNAME=your_username

# 3. Run all services
task docker:run:registry
```

### Access Services
- **Frontend**: http://localhost:3030
- **Catalogue API**: http://localhost:5000
- **Voting API**: http://localhost:8080
- **Recommendation API**: http://localhost:8081

### Common Commands

```bash
# View logs
task docker:compose:logs

# Stop services
task docker:compose:down

# Show all available tasks
task help
```

## 🔧 Development Workflow

### Running Services in Dev Mode

```bash
# Terminal 1
task frontend:dev

# Terminal 2
task catalogue:dev

# Terminal 3
task voting:dev

# Terminal 4
task recommendation:dev
```

### Building Your Own Images

```bash
# Using act (GitHub Actions locally)
task act:build:all

# Or build directly
task docker:build:parallel
```

## 🐛 Troubleshooting

### Registry Access Issues
```bash
# Ensure you're logged in
docker login ghcr.io -u YOUR_USERNAME

# Check token permissions
# Token needs: read:packages, write:packages
```

### Service Connection Issues
- Check service names in `frontend/config.json`
- Verify port mappings in `docker-compose.yml`
- Use `task docker:compose:logs` to debug

### Quick Fixes
```bash
# Restart a specific service
docker compose restart frontend

# Rebuild and run locally
task docker:run:local

# Clean start
task docker:compose:down
task docker:compose:up
```

## 📚 More Information

- Full documentation: [README.md](README.md)
- All tasks: `task --list`
- Task help: `task help`
