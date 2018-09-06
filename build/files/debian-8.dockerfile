FROM debian:8
STOPSIGNAL SIGRTMIN+3
ENV container docker
CMD [ "/sbin/init" ]
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    python-apt \
    python3-apt \
    sudo \
  && rm -rf /var/lib/apt/lists/* \
  && apt-get clean
RUN useradd -mG sudo privileged \
  && useradd -m unprivileged
COPY systemd-setup.sh /root/
RUN /root/systemd-setup.sh
