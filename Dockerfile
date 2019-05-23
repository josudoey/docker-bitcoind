FROM ubuntu:xenial
MAINTAINER Joey Fang <josudoey@gmail.com>

ENV HOME /bitcoin

RUN apt-get update && apt-get install -y --no-install-recommends \
        software-properties-common
RUN add-apt-repository -y ppa:bitcoin/bitcoin

RUN apt-get update && apt-get install -y --no-install-recommends \
                bitcoind=0.18.0-xenial1 \
        && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 8332 8333 18332 18333 28332 28333

WORKDIR /bitcoin

VOLUME ["/bitcoin/"]
