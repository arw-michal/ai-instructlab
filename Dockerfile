FROM python:3.10-slim

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Clone the instructlab repo
RUN git clone https://github.com/instructlab/instructlab.git . 

# Install Python dependencies
RUN pip install --no-cache-dir .

# Default command
CMD ["ilab", "--help"]
