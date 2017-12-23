FROM ubuntu:xenial
LABEL maintainer="skinlayers@gmail.com"


RUN set -eux && \
    adduser --system --home /data --group ethereum && \
    echo 'deb http://ppa.launchpad.net/ethereum/ethereum/ubuntu xenial main' > \
        /etc/apt/sources.list.d/ethereum-ubuntu-ethereum-xenial.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 923F6CA9 && \
    apt-get update && apt-get -y install ethereum && \
    rm -r /var/lib/apt/lists/* && \
    chmod 0700 /data

COPY ./docker-entrypoint.sh /

RUN chmod 0755 /docker-entrypoint.sh

EXPOSE 6060 8545 8546 30303

VOLUME /data

USER ethereum

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/usr/bin/geth"]
