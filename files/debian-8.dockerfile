FROM debian:8
CMD [ "/sbin/init" ]
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    python \
    python3 \
    sudo \
  && rm -rf /var/lib/apt/lists/* \
  && apt-get clean
RUN useradd -mG sudo privileged \
  && useradd -m unprivileged
