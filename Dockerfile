FROM python:3.11-slim

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Clone InstructLab repo
RUN git clone https://github.com/instructlab/instructlab.git .

# Pre-install pip tools and upgrade pip
RUN pip install --upgrade pip setuptools wheel

# Install InstructLab
RUN pip install --no-cache-dir .

# Optional: keep container alive in OpenShift for debugging or manual use
CMD ["tail", "-f", "/dev/null"]
