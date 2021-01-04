FROM ubuntu:20.04

# Add Unprivileged User 'cartoboss' for security
RUN addgroup --gid 10001 --system cartoboss && \
    adduser --uid 10000 --system --ingroup cartoboss --home /home/cartoboss cartoboss

# Setup build environment
RUN apt-get update && \
    apt-get -y install \
          build-essential \
          git \
          libsqlite3-dev \
          libprotobuf-dev \
          protobuf-compiler \
          tini \
          zlib1g-dev

# Build Tippecanoe
RUN mkdir -p /tmp/tippecanoe-src && \
    cd /tmp/tippecanoe-src && \
    git clone --branch v1.8.1 --depth 1 https://github.com/mapbox/tippecanoe.git . && \
    make && \
    make install && \
    cd / && \
    rm -rf /tmp/tippecanoe-src && \
    apt-get -y remove --purge \
        git \
        build-essential && \
    apt-get -y autoremove

# Set default user
USER cartoboss

# Use tini to prevent zombie processes, etc. and to not require `--init` on `docker run`
ENTRYPOINT [ "tini", "--", "tippecanoe" ]