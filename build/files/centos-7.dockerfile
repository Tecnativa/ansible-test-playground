FROM centos/systemd
STOPSIGNAL SIGRTMIN+3
RUN yum -y install \
    python \
    python3 \
    sudo \
  && systemctl mask systemd-nologin \
  && yum clean all \
  && rm -rf /var/cache/yum
RUN useradd -mG wheel privileged \
  && useradd -m unprivileged
