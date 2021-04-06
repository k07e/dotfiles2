# k07e's dotfiles

## Install

```
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

# or shorter
./install.sh
```

## Uninstall

```
find \
  -type d -name .git          -prune -o \
  -type f -name .editorconfig -prune -o \
  -type f -name README.md     -prune -o \
  -type f -name install.sh    -prune -o \
  -type f -name uninstall.sh  -prune -o \
  -type f -print |
  xargs -P0 -I% rm -fv "$HOME/%"

# or shorter
./uninstall.sh
```

## Settings

List of local configuration files:

- `~/.gitconfig.local`
