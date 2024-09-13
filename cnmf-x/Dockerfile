FROM mambaorg/micromamba:1.5.0

# Create a working directory
WORKDIR /app
USER root
RUN apt-get update && apt-get install -y \
    g++ \
    build-essential \
    && apt-get clean
    
COPY ./cnmf-x/environment.yml /app/environment.yml
RUN micromamba create --yes --file /app/environment.yml && micromamba clean --all --yes
ENV PATH /opt/conda/envs/cnmf/bin:$PATH
SHELL ["/bin/bash", "-c"]
ENTRYPOINT ["micromamba", "run", "-n", "cnmf", "/bin/bash"]
CMD ["bash"]
