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

# Upgrade pip tools
RUN pip install --upgrade pip setuptools wheel

# Install InstructLab
RUN pip install --no-cache-dir .

# Keep container alive for testing
CMD ["tail", "-f", "/dev/null"]
