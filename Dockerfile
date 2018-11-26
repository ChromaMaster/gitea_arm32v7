FROM chromamaster/alpine_arm32v7

ENV GITEA_VERSION 1.6.0
ENV GITEA_ARCH arm-7
ENV GITEA_RELEASE_URL https://github.com/go-gitea/gitea/releases/download/v${GITEA_VERSION}/gitea-${GITEA_VERSION}-linux-${GITEA_ARCH}

ENV USER git
ENV GITEA_CUSTOM /data/gitea
ENV GODEBUG=netdns=go

RUN apk update && \
  apk add \
    su-exec \
    ca-certificates \
    sqlite \
    bash \
    git \
    linux-pam \
    s6 \
    curl \
    openssh \
    wget \
    tzdata && \
  rm -rf \
    /var/cache/apk/* && \
  addgroup \
    -S -g 1000 \
    git && \
  adduser \
    -S -H -D \
    -h /data/git \
    -s /bin/bash \
    -u 1000 \
    -G git \
    git && \
  echo "git:$(date +%s | sha256sum | base64 | head -c 32)" | chpasswd

COPY gitea/docker /

RUN mkdir -p /app/gitea && \
    wget -O /app/gitea/gitea $GITEA_RELEASE_URL && \
    chmod +x /app/gitea/gitea

EXPOSE 22 3000

VOLUME ["/data"]

ENTRYPOINT ["/usr/bin/entrypoint"]
CMD ["/bin/s6-svscan", "/etc/s6"]
