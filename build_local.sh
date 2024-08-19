
set -e

# Build the base image
docker buildx build --platform linux/amd64,linux/arm64 -t nanitefactorygame/devcontainer-base:latest .

# Build the C image
docker buildx build --platform linux/amd64,linux/arm64 -t nanitefactorygame/devcontainer-c:latest ./languages/c

# Build the Go image
docker buildx build --platform linux/amd64,linux/arm64 -t nanitefactorygame/devcontainer-go:latest ./languages/go

# Build the Javascript image
docker buildx build --platform linux/amd64,linux/arm64 -t nanitefactorygame/devcontainer-javascript:latest ./languages/javascript

# Build the Python image
docker buildx build --platform linux/amd64,linux/arm64 -t nanitefactorygame/devcontainer-python:latest ./languages/python

# Build the Rust image
docker buildx build --platform linux/amd64,linux/arm64 -t nanitefactorygame/devcontainer-rust:latest ./languages/rust

# Build the Zig image
docker buildx build --platform linux/amd64,linux/arm64 -t nanitefactorygame/devcontainer-zig:latest ./languages/zig