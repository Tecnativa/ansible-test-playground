#!/usr/bin/env bash
set -ex

cd /lib/systemd/system

# Distros usually use the default graphical.target, useless in a container
systemctl set-default multi-user.target

# Disable unnecesary units
systemctl mask \
  $(ls sysinit.target.wants) \
  $(ls sockets.target.wants/*udev* sockets.target.wants/*initctl* | \
    basename -a $(cat)) \
  getty.target \
  local-fs.target \
  remote-fs.target \
  tmp.mount

# Re-enable needed units
systemctl unmask \
  systemd-journald.service \
  systemd-tmpfiles-setup.service
