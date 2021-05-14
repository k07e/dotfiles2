start-debian.sh << end
{
  apt-fast install -y vnc4server
  vncpasswd
} </dev/tty
end
