FROM centos/systemd
RUN yum -y install \
    python \
    python3 \
    sudo \
  && yum clean all \
  && rm -rf /var/cache/yum \
  && rm -f /usr/lib/tmpfiles.d/systemd-nologin.conf
RUN useradd -mG wheel privileged \
  && useradd -m unprivileged
