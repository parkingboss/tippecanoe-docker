FROM ubuntu:20.04

RUN \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get -y install \
        build-essential \
        zlib1g-dev \
        libsqlite3-dev \
        libprotobuf-dev \
        protobuf-compiler \
        git && \
  mkdir -p /tmp/tippecanoe-src && \
  cd /tmp/tippecanoe-src && \
  git clone --branch v1.8.1 --depth 1 https://github.com/mapbox/tippecanoe.git . && \
  make && \
  make install && \
  cd - && \
  rm -rf /tmp/tippecanoe-src && \
  apt-get -y remove --purge \
      git \
      build-essential && \
  apt-get -y autoremove

CMD tippecanoe --help
