@echo off
docker run --rm -it ^
  -v "%cd%":/data ^
  -w /home/appuser/app ^
  python-app:latest bash
