# Use the official ncbi/sra-tools Docker image as base
FROM ncbi/sra-tools
RUN apk update && apk add --no-cache \
    bash \
    curl \
    wget \
    python3 \
    py3-pip

RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
    apt-get update && \
    apt-get install -y google-cloud-sdk

