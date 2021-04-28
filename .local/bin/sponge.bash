#!/bin/bash
temp="$(mktemp)"
trap "rm \"$temp\"" EXIT
cat >"$temp"
cat "$temp"
