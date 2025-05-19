# Base image: R 4.5.0
FROM rocker/r-ver:4.5.0

# System libraries for tidyverse & friends
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        libcurl4-openssl-dev libssl-dev libxml2-dev \
        make gcc g++ gfortran && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy repo into container
WORKDIR /workspace
COPY . /workspace

# Install renv and restore packages (won’t error if renv.lock absent)
RUN R -e "install.packages('renv', repos='https://cloud.r-project.org')" && \
    R -e "if (file.exists('renv.lock')) renv::restore(prompt = FALSE)"

CMD ["bash"]


