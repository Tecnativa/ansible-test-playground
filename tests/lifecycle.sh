#!/usr/bin/env bash
set -e
cd $(dirname $0)
output=$(mktemp)

_run () {
  unbuffer ansible-playbook $1 -i inventory.cfg | tee $output
}

_changed () {
  local arg=
  local with=without
  local recap="$(grep -A 9999 'PLAY RECAP' $output | tail -n +2 -)"
  if [ "$1" -eq 0 ]; then
    arg=--invert-match
    with=with
  fi
  match="$(echo "$recap" | grep $arg 'changed=0')"
  if [ -n "$match" ]; then
    echo === Found unexpected lines $with changes: ===
    echo $match
    return 1
  fi
}

echo === Creating, changes expected ===
_run create.yml
_changed 1

echo === Creating again, no changes expected ===
_run create.yml
_changed 0

echo === Destroying, changes expected ===
_run destroy.yml
_changed 1

echo === Destroying again, no changes expected ===
_run destroy.yml
_changed 0
