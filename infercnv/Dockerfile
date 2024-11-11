# Start with the trinityctat/infercnv base image
FROM trinityctat/infercnv

# Install dependencies for Google Cloud SDK
RUN apt-get update && apt-get install -y \
    curl \
    apt-transport-https \
    ca-certificates \
    gnupg \
    fuse \
    gcsfuse \
    && rm -rf /var/lib/apt/lists/*

# Download and install Google Cloud SDK
RUN curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-415.0.0-linux-x86_64.tar.gz \
    && tar -xzf google-cloud-sdk-415.0.0-linux-x86_64.tar.gz -C /usr/local \
    && /usr/local/google-cloud-sdk/install.sh --quiet \
    && rm google-cloud-sdk-415.0.0-linux-x86_64.tar.gz

# Add the Google Cloud SDK to PATH
ENV PATH="/usr/local/google-cloud-sdk/bin:${PATH}"


# Verify installation
