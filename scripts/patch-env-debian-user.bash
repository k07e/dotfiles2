tab=$'\t'
read -p 'input username: ' username
./start-debian.sh << end
apt-get install -y sudo
useradd -m $username -s /bin/bash
passwd $username
echo "$username${tab}ALL=(ALL:ALL) ALL" >/etc/sudoers.d/$username
end
sed -i "s:\\(HOME=\\|-w \\)/root:\\1/home/$username:;s/\\(bash --login\\)/sudo --user $username \1/" start-debian.sh
