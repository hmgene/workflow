# Start with the trinityctat/infercnv base image
FROM trinityctat/infercnv
USER root
# Install dependencies for Google Cloud SDK
RUN apt-get update && apt-get install -y \
    curl \
    apt-transport-https \
    ca-certificates \
    gnupg \
    && rm -rf /var/lib/apt/lists/*

# Download and install Google Cloud SDK
RUN curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-415.0.0-linux-x86_64.tar.gz \
    && tar -xzf google-cloud-sdk-415.0.0-linux-x86_64.tar.gz -C /usr/local \
    && /usr/local/google-cloud-sdk/install.sh --quiet \
    && rm google-cloud-sdk-415.0.0-linux-x86_64.tar.gz

ENV PATH="/usr/local/google-cloud-sdk/bin:${PATH}"
RUN mkdir /mnt/data
WORKDIR /mnt/data
ENV GOOGLE_APPLICATION_CREDENTIALS="/root/service-account-key.json"

RUN echo "deb http://packages.cloud.google.com/apt gcsfuse-$(lsb_release -c -s) main" | tee /etc/apt/sources.list.d/gcsfuse.list \
    && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - \
    && apt-get update && apt-get install -y gcsfuse fuse

# Verify installation
