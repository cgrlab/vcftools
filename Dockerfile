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
    libgnutls-dev \
    autoconf

RUN git clone https://github.com/cgrlab/vcftools.git
RUN cd vcftools; git checkout tags/v0.1.14

RUN cd vcftools; ./autogen.sh
RUN cd vcftools; ./configure
RUN cd vcftools; make
RUN cd vcftools; make install

WORKDIR /opt
