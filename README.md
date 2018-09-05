# Ansible Test Playground

[![Build Status](https://travis-ci.org/Tecnativa/ansible-test-playground.svg?branch=master)](https://travis-ci.org/Tecnativa/ansible-test-playground)
[![Docker Pulls](https://img.shields.io/docker/pulls/tecnativa/ansible-test-playground.svg)](https://hub.docker.com/r/tecnativa/ansible-test-playground)

This role deploys a desired inventory using systemd-enabled docker images for
different supported OS, so **it is made for testing other roles or playbooks**.

## Requirements

- `pip install -r requirements.txt`
- A running Docker daemon.

## Role Variables

See [`defaults/main.yml`][defaults] to know about the default values and the
available variables.

## How To Use This Role And The `:lifecycle` Docker Image

[See the example here][testdir]. It also includes explanations.

## License

Apache 2.

## Author Information

This project is maintained by:

[![Tecnativa logo](https://www.tecnativa.com/logo.png "Tecnativa")][Tecnativa]

[Tecnativa][] is an IT consulting company specialized in Odoo and provides Odoo
development, installation, maintenance and hosting services.

[defaults]: https://github.com/Tecnativa/ansible-test-playground/tree/master/defaults/main.yml
[inventory]: https://github.com/Tecnativa/ansible-test-playground/tree/master/tests/inventory.cfg
[Tecnativa]: https://www.tecnativa.com/
