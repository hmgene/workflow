FROM mambaorg/micromamba:1.5.0

# Create a working directory
WORKDIR /app
USER root
RUN apt-get update && apt-get install -y \
    g++ \
    build-essential \
    && apt-get clean
    
# Optional: create an environment using an environment.yml file
COPY ./cnmf-x/environment.yml /app/environment.yml

# Create the conda environment
RUN micromamba create --yes --file /app/environment.yml && micromamba clean --all --yes
# Activate the environment and set the default shell
SHELL ["/bin/bash", "-c"]
ENTRYPOINT ["/bin/bash"]
RUN micromamba activate cnmf
