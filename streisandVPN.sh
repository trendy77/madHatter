#!/bin/bash
# streisand VPN
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd -P)"
## see: https://github.com/StreisandEffect/streisand
# read -p "windows or linux install? (w for win)" RESP
# if [ "$RESP" = "w" ] ; then
# KALI WSL...
#	ZEEFOLDER="/mnt/c/Users/trend_uvf08d1/Documents/"
#else
# KALI NORMAL...
ZEEFOLDER="/home/t/Documents/"
# fi
echo "Zee Folder will be $ZEEFOLDER"
### setup
echo "INSTALLING DEPENDENCIES"
sudo apt-get install python-paramiko python-pip python-pycurl python-dev build-essential -y
sudo pip install ansible markupsafe
# FOR AZURE...
# sudo pip install ansible[azure]
# FOR DIGITALOCEAN...
# sudo pip install dopy==0.3.5
# FOR GOOGLE!!
echo "INSTALLING GOOGLE LIBRARY"
sudo pip install 'apache-libcloud>=1.17.0'
echo "INSTALLED>"
cd $ZEEFOLDER
# clone the repo and go into folder
git clone https://github.com/StreisandEffect/streisand.git
cd streisand/deploy || exit
sudo chmod +x ./streisand-new-cloud-server.sh
sudo chmod +x ./streisand-existing-cloud-server.sh
### scripted deployment
  #	# KALI WSL...
#    sudo ./streisand-new-cloud-server.sh --provider google --site-config ~/Dropbox/blackHattery/kalit00ls/google-site.yml

sudo ./streisand-existing-cloud-server.sh --ssh-user ubuntu --ip-address 35.199.15.206 --site-config $SCRIPT_DIR/google-site.yml

#	sudo ./streisand-new-cloud-server.sh \
#	--provider google \
#	--site-config /mnt/c/Users/trend_uvf08d1/Documents/keys/google-siteW.yml
#else
# KALI NORMAL...
