# Ansible Test Playground

[![Build Status](https://travis-ci.org/Tecnativa/ansible-test-playground.svg?branch=master)](https://travis-ci.org/Tecnativa/ansible-test-playground)
[![Docker Pulls](https://img.shields.io/docker/pulls/tecnativa/ansible-test-playground.svg)](https://hub.docker.com/r/tecnativa/ansible-test-playground)
[![GitHub license](https://img.shields.io/github/license/Tecnativa/ansible-test-playground.svg)](https://github.com/Tecnativa/ansible-test-playground/blob/master/LICENSE)
[![Ansible Galaxy](https://img.shields.io/badge/ansible--galaxy-tecnativa.ansible__test__playground-blue.svg)][galaxy]

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

You can also take a look at these projects, which use this testing framework:

- [`tecnativa.docker`](https://github.com/Tecnativa/ansible-role-docker).

## License

Apache 2.

## Author Information

This project is maintained by:

[![Tecnativa logo](https://www.tecnativa.com/logo.png "Tecnativa")][Tecnativa]

[Tecnativa][] is an IT consulting company specialized in Odoo and provides Odoo
development, installation, maintenance and hosting services.

[defaults]: https://github.com/Tecnativa/ansible-test-playground/tree/master/defaults/main.yml
[galaxy]: https://galaxy.ansible.com/yajo/ansible_test_playground
[inventory]: https://github.com/Tecnativa/ansible-test-playground/tree/master/tests/inventory.cfg
[Tecnativa]: https://www.tecnativa.com/
[testdir]: https://github.com/Tecnativa/ansible-test-playground/tree/master/tests
