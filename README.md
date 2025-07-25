# Codespaces Demo (RHEL)

Demo of configuring CodeSpaces for use with RHEL universal base images (UBI).

## Overview

This repository provides a setup for using GitHub Codespaces with Red Hat Enterprise Linux (RHEL) Universal Base Images (UBI). It includes configurations for Docker, VS Code, and GitHub Actions workflows to streamline development in a containerized environment.

## Repository Structure

- `.devcontainer/`
  - `aliases.sh`: Shell aliases for the development container.
  - `devcontainer.json`: Configuration file for the development container.
  - `Dockerfile`: Dockerfile to build the development container image.
  - `p10k.zsh`: Configuration for the Powerlevel10k theme in Zsh.
  - `post-create.sh`: Script to run after the container is created.

- `.github/`
  - `workflows/`
    - `build-ubi.yml`: GitHub Actions workflow to build and push Docker images.

- `.vscode/`
  - `devcontainers.code-snippets`: Code snippets for development containers.
  - `rhel-yeah.code-workspace`: VS Code workspace configuration.
  - `shell.code-snippets`: Shell script snippets.

- `.gitignore`: Git ignore file.
- `.pre-commit-config.yaml`: Configuration for pre-commit hooks.
- `LICENSE`: License file.
- `README.md`: This documentation file.

## Development Container

The development container is configured using the `.devcontainer/devcontainer.json` file. It uses a custom Docker image based on RHEL UBI 8/9. Key features include:

- Custom VS Code settings and extensions.
- Installation of Zsh and other utilities.
- Post-create script to disable subscription manager and perform additional setup.

### Dockerfile

The `.devcontainer/Dockerfile` builds the development container image. It installs necessary development tools and configures the environment for non-root user `vscode`.

### GitHub Actions Workflow

The `.github/workflows/` directory contains the following workflows:

- `build-ubi.yml`: Builds and pushes Docker images for RHEL 8 and 9 to the GitHub Container Registry. Runs daily at 00:00 UTC.
- `build-fedora.yml`: Builds and pushes Docker images for Fedora-based environments.
- `build-rocky.yml`: Builds and pushes Docker images for Rocky Linux-based environments.

### Pre-commit Hooks

The `.pre-commit-config.yaml` file configures pre-commit hooks to ensure code quality. It includes hooks for checking trailing whitespace, end-of-file fixes, YAML validation, and large file checks.

## Usage

To use this repository with GitHub Codespaces:

1. Open the repository in GitHub Codespaces.
2. The development container will be built and configured automatically.
3. Start coding with the pre-configured environment.

## Notes

- [2024-08-03]: Removed support for RHEL7 images as VS Code is unsupported on it.

## License

This project is licensed under the terms of the [LICENSE](LICENSE) file.