# Ansible Test Playground Usage Example

This `tests` folder is a good example for you on how to use this project to
test your own roles. You will need to add a similar one to your roles.

Go see each one of the files. They are short and easy to understand.

## The Requirements

1. Docker running on `localhost`.
1. A `requirements.yml` file with, at least:

   ```yaml
   - src: yajo.ansible_test_playground
   ```

   It will usually be found in `tests/requirements.yml`.

## The Inventory

First of all, define an `inventory.cfg` file with, at least, the controller
host (usually `localhost`) and the expected playground layout:

```ini
localhost ansible_connection=local

[test-playground]
server0 test_playground_tag=debian-9
server1 test_playground_tag=ubuntu-18.04

[test-playground:vars]
ansible_connection=docker
```

## The Playbooks

We will use 3 playbooks to properly test your role.

*Notice that this folder only uses 2, but that is normal because it only needs
to test the playground creation and deletion. Usually you will need 3.*

### `apply.yml`

Use a playbook similar to this to test what happens when you apply your role.

```yaml
# Start by creating the playground
- hosts: localhost
  roles:
    - role: yajo.ansible_test_playground

# The playground now exists, so you can test your own role
- hosts: test-playground
  roles:
    - role: ../..
```

### `unapply.yml`

Use a playbook similar to this to test what happens when you unapply your role.

```yaml
# This playbook must unapply your own role
- hosts: test-playground
  roles:
    - role: ../..
      vars:
        my_cool_role_state: absent
```

### `destroy.yml`

This simply destroys the testing playground once you finished playing with it:

```yaml
- hosts: test-playground-controller
  roles:
    - role: yajo.ansible_test_playground
      vars:
        test_playground_state: absent
```

### Lifecycle And Idempotence Check

You probably already realized that the 3 above playbooks should be idempotent
(running them a 2nd time should change nothing).

The provided `tecnativa/ansible-test-playground:lifecycle` Docker image will:

1. Run twice each one of the playbooks.
1. Ensure nothing changed in the 2nd round.

Any additional Ansible configuration can be done by
[using an `ansible.cfg` any of the supported environment variables][cfg].

[See its dockerfile][lcdf] to know its configurable environment variables and
defaults.

## The `.travis.yml` File

I imagine you want to use Travis, so here it is:

```yaml
sudo: required
language: python
python:
  - "3.6"
services:
  - docker
script:
  - docker container run --rm -it
    -v /var/run/docker.sock:/var/run/docker.sock:ro \
    -v $(pwd):/role:ro \
    tecnativa/ansible-test-playground:lifecycle \
    apply.yml unapply.yml destroy.yml
```

[cfg]: https://docs.ansible.com/ansible/latest/reference_appendices/config.html
[lcdf]: https://github.com/Tecnativa/ansible-test-playground/blob/master/build/files/debian-9.dockerfile
[roledir]: https://docs.ansible.com/ansible/2.6/user_guide/playbooks_reuse_roles.html#role-directory-structure
[testdir]: https://github.com/Tecnativa/ansible-test-playground/tree/master/tests
