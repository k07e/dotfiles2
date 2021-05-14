./start-debian.sh << end
{
  apt-fast install -y locales task-japanese
  sudo sed -i 's/^# \(ja_JP.UTF-8 UTF-8\)/\1/' /etc/locale.gen
  sudo /usr/sbin/locale-gen
  sudo dpkg-reconfigure tzdata
} </dev/tty
end
sed -i 's/\(LANG=\)C.UTF-8/\1ja_JP.UTF-8/' start-debian.sh
