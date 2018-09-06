FROM debian:9
STOPSIGNAL SIGRTMIN+3
ENV container docker
CMD [ "/bin/systemd" ]
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    python \
    python3 \
    sudo \
    systemd \
  && systemctl set-default multi-user.target \
  && rm -rf /var/lib/apt/lists/* \
  && apt-get clean
RUN useradd -mG sudo privileged \
  && useradd -m unprivileged
