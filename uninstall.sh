#!/bin/bash
cd "$(dirname "$0")"
find \
  -type d -name .git          -prune -o \
  -type d -name docs          -prune -o \
  -type d -name scripts       -prune -o \
  -type d -name templates     -prune -o \
  -type f -name .editorconfig -prune -o \
  -type f -name README.md     -prune -o \
  -type f -name install.sh    -prune -o \
  -type f -name uninstall.sh  -prune -o \
  -type f -print |
  xargs -P0 -I% rm -fv "$HOME/%"
