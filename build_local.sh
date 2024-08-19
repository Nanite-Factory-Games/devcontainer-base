
set -e

# Build the base image
docker build -t nanitefactorygame/devcontainer-base:latest .

# Build the C image
docker build -t nanitefactorygame/devcontainer-c:latest ./languages/c

# Build the Go image
docker build -t nanitefactorygame/devcontainer-go:latest ./languages/go

# Build the Javascript image
docker build -t nanitefactorygame/devcontainer-javascript:latest ./languages/javascript

# Build the Python image
docker build -t nanitefactorygame/devcontainer-python:latest ./languages/python

# Build the Rust image
docker build -t nanitefactorygame/devcontainer-rust:latest ./languages/rust

# Build the Zig image
docker build -t nanitefactorygame/devcontainer-zig:latest ./languages/zig