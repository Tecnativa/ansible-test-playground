# Ansible Test Playground

[![Build Status](https://travis-ci.org/Tecnativa/ansible-test-playground.svg?branch=master)](https://travis-ci.org/Tecnativa/ansible-test-playground)

This role deploys a desired inventory using systemd-enabled docker images for
different supported OS, so you can test your roles.

## Requirements

- `pip install -r requirements.txt`
- A running Docker daemon.

## Role Variables

See [`defaults/main.yml`][defaults] to know about the default values and the
available variables.

## Example Playbook

First of all, define an `inventory.cfg` file with, at least, the controller
host (usually `localhost`) and the expected playground layout. I'll follow
[this example][inventory].

Then we can define the testing playbook similar to this:

```yaml
# It's important that this one is the 1st step, because if other steps match
# the playground nodes, they will try to get their facts, and they will fail
# because those nodes still do not exist
- hosts: test-playground-controller
  roles:
    - role: yajo.ansible-test-playground

# At this point, the playground should exist already, so you can test your
# own role or do whatever you want with it
- hosts: test-playground
  roles:
    - role: .

# Destroy the playground when you finish
- hosts: test-playground-controller
  roles:
    - role: yajo.ansible-test-playground
      vars:
        test_playground_state: absent
```

## License

Apache 2.

## Author Information

This project is maintained by:

[![Tecnativa logo](https://www.tecnativa.com/logo.png "Tecnativa")][Tecnativa]

[Tecnativa][] is an IT consulting company specialized in Odoo and provides Odoo
development, installation, maintenance and hosting services.

[defaults]: https://github.com/Tecnativa/ansible-role-docker/tree/master/defaults/main.yml
[inventory]: https://github.com/Tecnativa/ansible-role-docker/tree/master/tests/inventory.cfg
[Tecnativa]: https://www.tecnativa.com/
