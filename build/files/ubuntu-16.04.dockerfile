FROM ubuntu:16.04
STOPSIGNAL SIGRTMIN+3
ENV container docker
CMD [ "/sbin/init" ]
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    python-apt \
    python3-apt \
    sudo \
    systemd \
  && systemctl set-default multi-user.target \
  && rm -rf /var/lib/apt/lists/* \
  && apt-get clean
RUN useradd -mG sudo privileged \
  && useradd -m unprivileged
