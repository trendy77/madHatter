#!/bin/bash
# SSH SETUP ON LINUX MCU
# SPECIFICALLY, KALIPi

# Update the server
echo "Updating the server."
apt-get update
apt-get -y upgrade
apt-get -y autoremove
sudo apt install ~/Documents/urserver-3.6.0.478.deb -y || sudo apt-get install -f ~/Documents/urserver-3.6.0.478.deb -y
sudo apt install tigervnc-standalone-server -y
sudo apt-get install openssh openssh-server gesftpserver kvpnc libjsch-agent-proxy-java libnet-openssh-parallel-perl libnet-openssh-perl libnet-sftp-foreign-perl libnet-sftp-sftpserver-perl openssh-client openssh-known-hosts openssh-sftp-server putty-tools python-sshpubkeys python3-asyncssh python3-scp python3-setproctitle python3-sshpubkeys secpanel ssh-audit sshpass -y
sudo apt-get install curl cmake build-essential mailutils python-dev python-pip libusb-1.0-0-dev python-numpy htop ftp locate screen kismet pure-ftpd tightvncserver mysql-server darkstat ntopng mana-toolkit beef-xss resolvconf mitmf dns2proxy dnsmasq hostapd metasploit-framework -y
sudo apt-get update -y && sudo apt-get upgrade -y
systemctl disable mysql
updatedb
#apt-get install openvas
#openvas-setup
#mkdir -p /etc/systemd/system/greenbone-security-assistant.service.d/
#cp /root/Documents/local.conf /etc/systemd/greenbone-security-assistant.service.d/local.conf
#openvasmd --user=t --new-password=t

# Configure SSH to run on persistently. In other words survive a reboot. First remove run levels for SSH
sudo update-rc.d -f ssh remove
# load the default SSH run level
sudo update-rc.d -f ssh defaults
# make sure SSH service always restarts on reboot in Kali Linux
sudo update-rc.d -f ssh enable 2 3 4 5
sudo service ssh restart

# Add DynamicDNS updater to cron
echo "setting DynamicDNS"
cat ./piCronIp.sh >> crontab -e

# Update the SSH configuration
#echo "Reconfiguring SSH."
# sed "s/Port 22/Port 22222/" < /etc/ssh/sshd_config > /tmp/sshd_config
#cp ./sshd_config /etc/ssh/sshd_config
#cp ./ssh_config /etc/ssh/ssh_config
#cp ./streisand1 ~/.ssh
#cp ./config.streisand ~/.ssh/config

# To enable the on-screen keyboard in the greeter/login screen
# add to /etc/lightdm/lightdm-gtk-greeter.conf

#cat 'show-indicators=~language;~a11y;~session;~power
#keyboard=florence --focus' >> /etc/lightdm/lightdm-gtk-greeter.conf

# Add a new low-privileged user account
echo "Adding new low-privileged user account. usr:tpi pass:pp"
ssh-keygen -f tpi -N tpi
useradd -d /home/tpi -m -G sudo -s /bin/bash tpi
echo "tpi:pp | chpasswd"
mkdir /home/tpi/.ssh
mv tpi.pub /home/tpi/.ssh/authorized_keys
chown -R tpi:tpi /home/tpi/.ssh
echo "User account tpi created with password pp"
cp /home/tpi/.ssh/tpi ./tpi
echo "DONE"
