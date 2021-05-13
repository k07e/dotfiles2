./start-debian.sh << end
{
  : https://github.com/ilikenwf/apt-fast
  cat << /cat >/etc/apt/sources.list.d/apt-fast.list
deb http://ppa.launchpad.net/apt-fast/stable/ubuntu bionic main 
deb-src http://ppa.launchpad.net/apt-fast/stable/ubuntu bionic main
/cat
  apt-key adv --keyserver keyserver.ubuntu.com --recv-keys A2166B8DE8BDC3367D1901C11EE2FF37CA8DA16B
  apt-get update
  DEBIAN_FRONTEND=noninteractive apt-get install -y apt-fast
  echo debconf apt-fast/maxdownloads string 16 | debconf-set-selections
  echo debconf apt-fast/dlflag boolean true | debconf-set-selections
  echo debconf apt-fast/aptmanager string apt-get | debconf-set-selections
} </dev/tty
end
