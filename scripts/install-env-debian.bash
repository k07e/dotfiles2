pkg install wget openssl-tool proot -y &&
  hash -r &&
  wget https://raw.githubusercontent.com/EXALAB/AnLinux-Resources/master/Scripts/Installer/Debian/debian.sh &&
  bash debian.sh
sed -i 's/\(TERM=\)$TERM/\1xterm-256color/' start-debian.sh
./start-debian.sh << end
{
  apt-get update
  apt-get upgrade -y
  apt-get install -y apt-utils
  apt-get install -y dialog
} </dev/tty
end
