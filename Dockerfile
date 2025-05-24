# syntax=docker/dockerfile:1

# 1. Use an official slim Python runtime (current Python 3.12)
FROM python:3.13-slim

# Install the Cisco Umbrella Root CA certificate
# See # See https://docs.docker.com/engine/network/ca-certs/
COPY res/Cisco_Umbrella_Root_CA.cer /usr/local/share/ca-certificates/Cisco_Umbrella_Root_CA.crt
RUN update-ca-certificates

# 2. Prevent Python from writing .pyc files and enable output buffering
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# 3. Create a non-root user to match VS Code’s default
RUN adduser --disabled-password --gecos "" appuser

WORKDIR /home/appuser
USER appuser

# 4. Copy only requirements first to leverage Docker cache
COPY --chown=appuser:appuser requirements.txt .

# 5. Install Python dependencies
RUN python -m pip install --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt

# 6. Copy the app code
COPY --chown=appuser:appuser entrypoint.sh .
COPY --chown=appuser:appuser app app

# 7. Make entrypoint script executable
RUN chmod +x ./entrypoint.sh

# 8. Default entrypoint
ENTRYPOINT ["/home/appuser/entrypoint.sh"]
