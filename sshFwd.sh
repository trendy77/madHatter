#! /bin/bash

cd ~/.ssh
cp /root/Dropbox/blackHattery/keys/streisand_rsa ~/.ssh
cp /root/Dropbox/blackHattery/keys/config >> ~/.ssh/config
sudo chmod 600 streisand_rsa || echo "error chmod-ing streisand_rsa"
sudo ssh -vND 8080 forward@streisand1
