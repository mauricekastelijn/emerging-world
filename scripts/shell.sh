#!/usr/bin/env bash
# Spawn an interactive shell in the container
docker run --rm -it \
  -v "$(pwd)":/data \
  -w /home/appuser/app \
  python-app:latest bash
