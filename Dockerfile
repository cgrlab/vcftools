FROM ubuntu:14.04

WORKDIR /opt

RUN apt-get update && apt-get install -y \
    build-essential \
    ca-certificates \
    wget \
    curl \
    unzip \
    git \
    libcurl4-gnutls-dev \
    libgnutls-dev

RUN git clone https://github.com/cgrlab/vcftools.git
RUN cd vcftoos; git checkout tags/v0.1.14

RUN ./autogen.sh
RUN ./configure
RUN make
RUN make install

WORKDIR /opt
