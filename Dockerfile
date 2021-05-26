FROM blcdsdockerregistry/bl-base:1.0.0 AS builder

# Use conda to install tools and dependencies into /usr/local
ARG MANTA_VERSION=1.6.0
RUN conda create -qy -p /usr/local \
    -c bioconda \
    -c conda-forge \
    manta==${MANTA_VERSION}

# Deploy the target tools into a base image
FROM ubuntu:20.04
COPY --from=builder /usr/local /usr/local

LABEL maintainer="Tim Sanders <tsanders@mednet.ucla.edu>"