FROM alpine:3.6
MAINTAINER Kazumichi Yamamoto <yamamoto.febc@gmail.com>

RUN set -x && apk add --no-cache curl ca-certificates zip && \
    curl -L https://github.com/docker/machine/releases/download/v0.13.0/docker-machine-Linux-x86_64 >/usr/local/bin/docker-machine && \
    chmod +x /usr/local/bin/docker-machine && \
    curl -LO https://github.com/sacloud/docker-machine-sakuracloud/releases/download/v0.0.16/docker-machine-driver-sakuracloud_linux-amd64.zip && \
    unzip docker-machine-driver-sakuracloud_linux-amd64.zip -d /usr/local/bin/ && \
    chmod +x /usr/local/bin/docker-machine-driver-sakuracloud 

ENTRYPOINT ["/usr/local/bin/docker-machine"]
CMD ["--help"]
