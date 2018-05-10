#!/usr/bin/env bash

apt-get install openssh openssh-server gesftpserver kvpnc libjsch-agent-proxy-java libnet-openssh-parallel-perl libnet-openssh-perl libnet-sftp-foreign-perl libnet-sftp-sftpserver-perl openssh-client openssh-known-hosts openssh-sftp-server putty-tools python-sshpubkeys python3-asyncssh python3-scp python3-setproctitle python3-sshpubkeys secpanel ssh-audit sshpass -y
sudo apt-get install aptitude curl cmake build-essential mailutils python-dev python-pip libusb-1.0-0-dev python-numpy htop ftp locate screen kismet pure-ftpd tightvncserver mysql-server darkstat ntopng mana-toolkit beef-xss resolvconf mitmf dns2proxy dnsmasq hostapd metasploit-framework -y

sudo apt-get update -y && sudo apt-get upgrade -y
systemctl disable mysql
updatedb
apt-get install openvas
openvas-setup
mkdir -p /etc/systemd/system/greenbone-security-assistant.service.d/
cp /root/Documents/local.conf /etc/systemd/greenbone-security-assistant.service.d/local.conf
openvasmd --user=t --new-password=t
