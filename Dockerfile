FROM pytorch/pytorch:2.1.0-cuda11.8-cudnn8-runtime

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

# Upgrade pip tooling
RUN pip install --upgrade pip setuptools wheel

# Install InstructLab from source
RUN pip install --no-cache-dir .

# Default to idle container for OpenShift
CMD ["tail", "-f", "/dev/null"]
