# Debian on Termux

## Start

### Install Debian

```
mkdir {{env-debian}}
cd $_
bash {{dotfiles2}}/scripts/install-env-debian.bash
```

### Install apt-fast

```
bash {{dotfiles2}}/scripts/patch-env-debian-apt-fast.bash
```

### Create user and install sudo

```
bash {{dotfiles2}}/scripts/patch-env-debian-user.bash
```

## Localization

### Japanize (日本語化)

```
bash {{dotfiles2}}/scripts/patch-env-debian-japanize.bash
```

## Additional patches

### Install GUI environment

```
bash {{dotfiles2}}/scripts/patch-env-debian-gui.bash
```

### Install vncserver

```
bash {{dotfiles2}}/scripts/patch-env-debian-vnc.bash
```

### Personalize by k07e

```
bash {{dotfiles2}}/scripts/patch-env-debian-personalize.bash
```

### Install texlive

```
bash {{dotfiles2}}/scripts/patch-env-debian-texlive.bash
```

### Install development tools

```
bash {{dotfiles2}}/scripts/patch-env-debian-devel.bash
```
