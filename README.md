# devcontainer-base
Base image that can run a devcontainer complete with an embedded IDE ready for addons for specific languages

## Building locally

To test if the images build before using the pipeline, first make sure you have docker installed and running.

Then make sure you have a docker driver set up

```bash
docker buildx create --name cplatbuilder --driver docker-container --bootstrap
docker buildx use cplatbuilder
```

Then run the build script

```bash
./build_local.sh
```

This will build the images for all the languages and push them to your local docker daemon.