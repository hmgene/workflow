FROM mambaorg/micromamba:1.5.0

# Create a working directory
WORKDIR /app

# Optional: create an environment using an environment.yml file
COPY ./cnmf-x/environment.yml /app/environment.yml

# Create the conda environment
RUN micromamba create --yes --file /app/environment.yml && micromamba clean --all --yes

# Activate the environment and set the default shell
SHELL ["/bin/bash", "-c"]
ENTRYPOINT ["/bin/bash"]
