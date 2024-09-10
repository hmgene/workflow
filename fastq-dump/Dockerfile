# Use the official ncbi/sra-tools Docker image as base
FROM ncbi/sra-tools

# Update package list and install bash
RUN apt-get update && apt-get install -y bash

# Set the default shell to bash (optional)
SHELL ["/bin/bash", "-c"]

# Optionally, you can set the entrypoint to bash if you want the container
# to always run bash when started. If you want to retain sra-tools' behavior,
# you can skip this step.
ENTRYPOINT ["/bin/bash"]
