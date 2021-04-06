# k07e's dotfiles

## Install

```
find \
  -type d -name .git          -prune -o \
  -type f -name .editorconfig -prune -o \
  -type f -name README.md     -prune -o \
  -type f -print |
  xargs -P0 -I% bash -ce "$(printf %s \
    'mkdir -pv "$HOME/$(dirname "%")";' \
    'ln -fsv "$PWD/%" "$HOME/%"'
  )"
```

## Uninstall

```
find \
  -type d -name .git          -prune -o \
  -type f -name .editorconfig -prune -o \
  -type f -name README.md     -prune -o \
  -type f -print |
  xargs -P0 -I% rm -fv "$HOME/%"
```
