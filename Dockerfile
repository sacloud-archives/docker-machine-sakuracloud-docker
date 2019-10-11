FROM alpine:3.10
MAINTAINER Kazumichi Yamamoto <yamamoto.febc@gmail.com>

RUN set -x && apk add --no-cache curl ca-certificates zip &&     curl -L https://github.com/docker/machine/releases/download/v0.16.2/docker-machine-Linux-x86_64 >/usr/local/bin/docker-machine &&     chmod +x /usr/local/bin/docker-machine &&     curl -LO https://github.com/sacloud/docker-machine-sakuracloud/releases/download/v1.4.1/docker-machine-driver-sakuracloud_linux-amd64.zip &&     unzip docker-machine-driver-sakuracloud_linux-amd64.zip -d /usr/local/bin/ &&     chmod +x /usr/local/bin/docker-machine-driver-sakuracloud

VOLUME ["/workdir"]
WORKDIR /workdir

ENTRYPOINT ["/usr/local/bin/docker-machine"]
CMD ["--help"]

