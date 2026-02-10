# Codespaces Demo (RHEL)

Demo of configuring GitHub Codespaces for Red Hat Enterprise Linux (RHEL) UBI and companion base images.

## Overview

This repo ships a Codespaces-ready devcontainer plus CI workflows that build and publish container images for RHEL UBI, Rocky Linux, and Fedora variants. Use it as a template for RHEL-flavored development environments or as a reference for shipping pre-built devcontainer images to GHCR.

## Quickstart (Codespaces)

1. Create a Codespace on the main branch.
2. The devcontainer defined in [.devcontainer/devcontainer.json](.devcontainer/devcontainer.json) will boot automatically using a `rockylinux:9` base image.
3. Post-create tasks in [.devcontainer/post-create.sh](.devcontainer/post-create.sh) make Zsh the default shell, install Powerlevel10k, and add git aliases from [.devcontainer/aliases.sh](.devcontainer/aliases.sh).
4. Start coding—common VS Code extensions (C/C++, Docker, Makefile tools, Copilot Chat, Remote Containers) are preinstalled.

## Devcontainer details

- Base image: `rockylinux:9` (override by building your own image with the Dockerfiles below).
- Features: common-utils with Zsh, `vscode` user, package upgrades.
- Extensions: listed in [.devcontainer/devcontainer.json](.devcontainer/devcontainer.json).
- Shell setup: Powerlevel10k theme and git aliases via [.devcontainer/post-create.sh](.devcontainer/post-create.sh) and [.devcontainer/aliases.sh](.devcontainer/aliases.sh).

### Building images locally

- RHEL UBI image: built from [.devcontainer/Dockerfile](.devcontainer/Dockerfile); pick a major version via `RHEL_VERSION` (8/9/10).

```sh
docker build -f .devcontainer/Dockerfile --build-arg RHEL_VERSION=9 -t ghcr.io/<owner>/devcontainer-rhelyeah:rhel-9 .devcontainer
```

- Rocky Linux variants live under [.devcontainer/RockyLinux](.devcontainer/RockyLinux) and Fedora under [.devcontainer/Fedora](.devcontainer/Fedora).

## CI workflows (GHCR publishing)

- RHEL UBI: [.github/workflows/build-ubi.yml](.github/workflows/build-ubi.yml) builds tags `rhel-8`, `rhel-9`, `rhel-10`, scans with Trivy, and uploads SARIF results daily at 00:00 UTC.
- Rocky Linux: [.github/workflows/build-rocky.yml](.github/workflows/build-rocky.yml) builds Rocky 8/9/10 images with appropriate repositories enabled (`powertools` for 8, `crb` for 9/10) and runs Trivy.
- Fedora: [.github/workflows/build-fedora.yml](.github/workflows/build-fedora.yml) builds the latest Fedora image and scans with Trivy.

Artifacts are pushed to `ghcr.io/<owner>/devcontainer-rhelyeah:*`.

## Pre-commit

Run pre-commit locally or inside the container to keep formatting and lint checks aligned:

```sh
pre-commit run -a
```

## Notes

- [2024-08-03]: Removed support for RHEL7 images as VS Code is unsupported on it.

## License

This project is licensed under the terms of the [LICENSE](LICENSE) file.