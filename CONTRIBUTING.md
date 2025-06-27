# Contributing to Craftista

We love your input! We want to make contributing to Craftista as easy and transparent as possible, whether it's:

- Reporting a bug
- Discussing the current state of the code
- Submitting a fix
- Proposing new features
- Becoming a maintainer

## We Develop with GitHub

We use GitHub to host code, to track issues and feature requests, as well as accept pull requests.

## We Use [GitHub Flow](https://guides.github.com/introduction/flow/index.html)

All code changes happen through pull requests:

1. Fork the repo and create your branch from `main`.
2. If you've added code that should be tested, add tests.
3. If you've changed APIs, update the documentation.
4. Ensure the test suite passes.
5. Make sure your code follows the standards (run `task check:standards`).
6. Issue that pull request!

## Any contributions you make will be under the MIT Software License

When you submit code changes, your submissions are understood to be under the same [MIT License](LICENSE) that covers the project.

## Report bugs using GitHub Issues

We use GitHub issues to track public bugs. Report a bug by [opening a new issue](https://github.com/nerds-run/craftista/issues/new).

## Write bug reports with detail, background, and sample code

**Great Bug Reports** tend to have:

- A quick summary and/or background
- Steps to reproduce
  - Be specific!
  - Give sample code if you can
- What you expected would happen
- What actually happens
- Notes (possibly including why you think this might be happening, or stuff you tried that didn't work)

## Development Setup

1. **Prerequisites**:
   - Docker and Docker Compose
   - Task runner (`brew install go-task/tap/go-task`)
   - Language-specific tools (Node.js, Python, Java, Go)

2. **Getting Started**:
   ```bash
   # Clone the repository
   git clone https://github.com/nerds-run/craftista.git
   cd craftista

   # Install dependencies
   task install

   # Run tests
   task test

   # Check standards
   task check:standards
   ```

3. **Working on Services**:
   ```bash
   # Frontend (Node.js)
   task frontend:dev

   # Catalogue (Python)
   task catalogue:dev

   # Voting (Java)
   task voting:dev

   # Recommendation (Go)
   task recommendation:dev
   ```

## Coding Standards

Please review [STANDARDS.md](STANDARDS.md) for detailed coding conventions.

### Quick Guidelines:

1. **Configuration**: Use camelCase for JSON configuration keys
2. **Environment Variables**: Use UPPER_SNAKE_CASE
3. **API Endpoints**: Use kebab-case for URLs
4. **Docker**: Always specify exact versions and use non-root users
5. **Testing**: Maintain minimum 70% code coverage
6. **Documentation**: Update READMEs when adding features

## Testing

- Write tests for new functionality
- Ensure all tests pass: `task test`
- Add integration tests for cross-service interactions
- Test coverage should be at least 70%

## Pull Request Process

1. Update the README.md with details of changes to the interface
2. Update the CHANGELOG.md with your changes
3. Increase version numbers in any examples files and config.json files
4. The PR will be merged once you have the sign-off of at least one maintainer

## Docker Image Building

When updating Dockerfiles:

1. Use specific base image versions (not `latest`)
2. Implement multi-stage builds where possible
3. Always create and use non-root users
4. Add HEALTHCHECK instructions
5. Test locally before pushing: `task docker:build`

## Helm Chart Updates

When updating Helm charts:

1. Test with all environments: `dev`, `test`, `prod`
2. Update values documentation
3. Run linting: `task helm:lint`
4. Test deployment: `task helm:dry-run`

## License

By contributing, you agree that your contributions will be licensed under its MIT License.

## Questions?

Feel free to open an issue with the tag "question" or reach out to the maintainers.