tab=$'\t'
read -p 'input username: ' username
read -sp 'input password: ' password
./start-debian.sh << end
apt-fast install -y sudo
useradd -m $username -s /bin/bash
echo "$username:$password" | chpasswd
echo "$username${tab}ALL=(ALL:ALL) ALL" >/etc/sudoers.d/$username
end
sed -i "s:\\(HOME=\\|-w \\)/root:\\1/home/$username:;s/\\(bash --login\\)/sudo --user $username \1/" start-debian.sh
