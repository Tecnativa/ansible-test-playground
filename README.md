Ansible Test Playground
=======================

This role deploys a desired inventory using systemd-enabled docker images for
different supported OS, so you can test your roles.

Requirements
------------

- `pip install -r requirements.txt`
- A running Docker daemon.

Role Variables
--------------

See [`defaults/main.yml`][defaults] to know about the default values and the
available variables.

Example Playbook
----------------

First of all, define an `inventory.cfg` file with, at least, the controller
host (usually `localhost`) and the expected playground to create:

```cfg
# The playground will be created from here, so this host must be properly
# configured to access a docker socket; privileged access is required
[test-playground-controller]
localhost ansible_connection=local ansible_python_interpreter=python3

# This group defines the expected playground, that will be created from the
# controller node
[test-playground]
centos-7 test_playground_tag=centos-7
debian-8 test_playground_tag=debian-8
debian-9 test_playground_tag=debian-9
ubuntu-16.04 test_playground_tag=ubuntu-16.04
ubuntu-18.04 test_playground_tag=ubuntu-18.04

# It is a requirement that playground hosts are connected via docker
[test-playground:vars]
ansible_connection=docker
```

    - hosts: servers
      roles:
         - { role: username.rolename, x: 42 }

License
-------

BSD

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).

[defaults]: https://github.com/Tecnativa/ansible-role-docker/tree/master/defaults/main.yml
