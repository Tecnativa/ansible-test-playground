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

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

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
