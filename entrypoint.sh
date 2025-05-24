#!/usr/bin/env bash
# entrypoint.sh

# Example: load environment variables from .env if you choose to use one
if [ -f .env ]; then
  export $(grep -v '^#' .env | xargs)
fi

# Default: run whatever CLI args were passed, or start your script
if [ "$#" -gt 0 ]; then
  exec "$@"
else
  exec python /home/appuser/app/main.py
fi
