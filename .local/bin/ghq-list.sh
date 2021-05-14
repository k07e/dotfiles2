#!/bin/bash
cd ~/ghq
find -type d -name .git -exec dirname '{}' \; | sed 's:^\./::'
