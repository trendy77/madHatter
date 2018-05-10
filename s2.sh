#!/bin/bash
# streisand VPN

ZEEFOLDER="/home/t/Documents/"
cd $ZEEFOLDER/streisand/deploy
sudo chmod +x ./streisand-new-cloud-server.sh
sudo chmod +x ./streisand-existing-cloud-server.sh
### scripted deployment
#./streisand-new-cloud-server.sh --provider google --site-config /root/Documents/blackHattery/kalit00ls/google-site.yml

./streisand-existing-cloud-server.sh --ssh-user ubuntu --ip-address 35.199.15.206 --site-config /root/Documents/google-site.yml
#	sudo ./streisand-new-cloud-server.sh \
#	--provider google \
#	--site-config /mnt/c/Users/trend_uvf08d1/Documents/keys/google-siteW.yml
#else
# KALI NORMAL...
