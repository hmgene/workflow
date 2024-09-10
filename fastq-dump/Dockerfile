# Use the official ncbi/sra-tools Docker image as base
FROM ncbi/sra-tools
RUN apk update && apk add --no-cache \
    bash \
    curl \
    wget \
    python3 \
    py3-pip

# Install AWS CLI
RUN pip3 install awscli
