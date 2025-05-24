#!/usr/bin/env bash
# Run the container, mounting your code for live edit/debug
docker run --rm -it \
  -v "$(pwd)":/data \
  -w /home/appuser/app \
  python-app:latest "$@"
