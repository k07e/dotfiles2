#!/bin/bash
cd "$(dirname "$0")"
find \
  -type d -name .git          -prune -o \
  -type f -name .editorconfig -prune -o \
  -type f -name README.md     -prune -o \
  -type f -name install.sh    -prune -o \
  -type f -name uninstall.sh  -prune -o \
  -type f -print |
  xargs -P0 -I% bash -ce "$(printf %s \
    'mkdir -pv "$HOME/$(dirname "%")";' \
    'ln -fsv "$PWD/%" "$HOME/%"'
  )"
