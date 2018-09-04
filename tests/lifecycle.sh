#!/usr/bin/env bash
set -ex
cd $(dirname $0)
output=$(mktemp)

_run () {
  unbuffer ansible-playbook $1 -i inventory.cfg | tee $output
}

_no_changes () {
  local recap="$(grep -A 9999 'PLAY RECAP' $output | tail -n +2 -)"
  match="$(echo "$recap" | grep -v 'changed=0')"
  if [ -n "$match" ]; then
    echo === Found unexpected lines with changes: ===
    echo "$match"
    return 1
  fi
}

echo === Creating ===
_run create.yml

echo === Creating again, no changes expected ===
_run create.yml
_no_changes

echo === Destroying ===
_run destroy.yml

echo === Destroying again, no changes expected ===
_run destroy.yml
_no_changes
