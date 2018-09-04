FROM ubuntu:18.04
CMD [ "/bin/systemd" ]
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    python \
    python3 \
    sudo \
    systemd \
  && rm -rf /var/lib/apt/lists/* \
  && apt-get clean
RUN useradd -mG sudo privileged \
  && useradd -m unprivileged
