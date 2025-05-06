FROM python:3.11-slim

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Clone the InstructLab repo
RUN git clone https://github.com/instructlab/instructlab.git .

# Install InstructLab and dependencies
RUN pip install --no-cache-dir .

# Keep container alive for interactive use, or change to desired command
CMD ["ilab", "--help"]
