# Use an appropriate base image with necessary tools
FROM ubuntu:20.04

# Switch to root user
USER root

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    curl \
    gnupg \
    ca-certificates \
    python3 \
    python3-pip \
    && apt-get clean

# Install the SRA Toolkit
RUN curl -L https://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/current/sratoolkit.current-ubuntu64.tar.gz \
    | tar xz -C /usr/local && \
    ln -s /usr/local/sratoolkit.*/bin/* /usr/local/bin/

# Install Google Cloud SDK
RUN curl -sSL https://sdk.cloud.google.com | bash && \
    /root/google-cloud-sdk/install.sh && \
    /root/google-cloud-sdk/bin/gcloud components install beta && \
    echo "source /root/google-cloud-sdk/path.bash.inc" >> ~/.bashrc

# Set environment variables
ENV PATH=$PATH:/root/google-cloud-sdk/bin

# Set the default entrypoint to bash
ENTRYPOINT ["/bin/bash"]

