[![CI/CD Pipeline](https://github.com/mauricekastelijn/dockerized-python-app-template/actions/workflows/cicd.yml/badge.svg)](https://github.com/mauricekastelijn/dockerized-python-app-template/actions/workflows/cicd.yml)

# Dockerized Python Application Template repository

Template repository for dockerized python application including a devcontainer

## Prerequisites

- Docker (latest)
- VS Code + Remote-Containers extension

## Project setup

### File structure

```plaintext
.
├── .devcontainer
│   └── devcontainer.json # VS Code Dev Container definition
├── app
│   └── main.py           # Main application entry point
├── scripts               # Helper scripts for build/run/shell
│   ├── build.sh          # Linux build script
│   ├── run.sh            # Linux run script
│   ├── shell.sh          # Linux shell script
│   ├── build.bat         # Windows build script
│   ├── run.bat           # Windows run script
│   └── shell.bat         # Windows shell script
├── .dockerignore         # Keep the image lean
├── Dockerfile            # Production + dev container image
├── entrypoint.sh         # Container entrypoint wrapper
├── requirements.txt      # Pinned deps for dev & prod
└── README.md             # This file
```

### Explanation of the setup

- **Single Dockerfile** for both production and development ensures identical
  environments.
- **VS Code Dev Container** (`.devcontainer/devcontainer.json`) points at that
  Dockerfile and runs `pip install -r requirements.txt` on create.
- **`requirements.txt`** pins the exact production deps, guaranteeing parity
  between dev and prod.
- **Helper scripts** under `scripts/` replace Make targets:
  - `build.{sh,bat}` builds the image  
  - `run.{sh,bat}` runs your code with volume mounting  
  - `shell.{sh,bat}` drops into a container shell  

### Requirements fulfilled

1. **Host independence**: Docker isolates Python versions, system libs, etc.  
2. **Dev ↔ Prod parity**: same image + same `requirements.txt` in both.  
3. **Editor integration**: open in container in VS Code with full linting, debugging, IntelliSense.  
4. **Minimal set-up**: clone repo → run one script (or open in container) → you’re live.

### Benefits

- **Reproducibility**: pin every library version, no “it works on my machine”
  surprises.  
- **Simplicity**: no local Python installs, virtualenvs, or Conda hassles.  
- **Consistency**: Dev containers and production containers are the *same*
  artifact.  
- **Cross-platform**: scripts for both Linux/macOS and Windows users.

## Development

1. **Build image**  
   - Linux/macOS: `./scripts/build.sh`  
   - Windows     : `scripts\build.bat`

2. **Open in VS Code**  
   - Command Palette → **Remote-Containers: Open Folder in Container**  
   - VS Code builds the image and installs deps automatically.

3. **Run or shell**  
   - Linux/macOS: `./scripts/run.sh` or `./scripts/shell.sh`  
   - Windows     : `scripts\run.bat`  or `scripts\shell.bat`

## Production

```bash
# Build
./scripts/build.sh

# Run
./scripts/run.sh
```
