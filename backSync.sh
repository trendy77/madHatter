#! /bin/bash
BACKDEST=/root/Dropbox/blackHattery/kaliBackup
HOST=kaliHub
cd $BACKDEST
# /etc/apt/sources.lists.d/<EVERTYHING IN THIS FOLDER>
cp -uR /etc/apt/sources.list.d $BACKDEST/etc/apt/sources.list.d
# handshakes folder

# copy the bash_aliases + bashhistory
# -u -- only if updated
#       ~/.ssh? folders
#       cp /etc/hosts & hostname files
cp -u /etc/hosts        $BACKDEST/etc/hosts.$HOST
cp -u /etc/hostname     $BACKDEST/etc/hostname.$HOST
cp -u /ssh/sshd_config  $BACKDEST/etc/hostname.$HOST
cp -u ¬/.ssh/sshd_config  $BACKDEST/etc/sshd_conf.$HOST
cp -u ¬/.ssh/ssh_config  $BACKDEST/.ssh/ssh_conf.$HOST
cp -u /root/.bash_history  $BACKDEST/historybashRoot$OF.$HOST
cp -u /home/t/.bash_history  $BACKDEST/historybashT$OF.$HOST
# docs folders?
# the conf files for WiFi networks / tunnels....
cp -u /etc/wpa_supplicant.conf $BACKDEST/etc/wpa_supplicant$HOST.conf
