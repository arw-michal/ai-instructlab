FROM pytorch/pytorch:2.1.0-cuda11.8-cudnn8-runtime

RUN apt-get update && apt-get install -y \
    git \
    curl \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
RUN git clone https://github.com/instructlab/instructlab.git .

RUN pip install --upgrade pip setuptools wheel
RUN pip install --no-cache-dir .

CMD ["tail", "-f", "/dev/null"]
