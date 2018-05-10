#! /bin/bash
### FREEDNS.AFRAID.ORG DNS UPDATE
DOMAIN=g.uk.ms
# LINUX
IPNOW_FILE=/mnt/c/Users/trend/iphistory.txt
OLDIP_FILE=/mnt/c/Users/trend/ip.txt
# WSL
#IPNOW_FILE=/root/ip/iphistory.txt
#OLDIP_FILE=/root/ip.txt

if [ $DOMAIN = "trendy.chickenkiller.com" ] ; then
    KEY=OFNrZ3FwRHNFZFZ4TTBiZTBLeXBCUG9DOjEyNTE4NjUx
    elif [ $DOMAIN = "t.uk.ms" ] ; then
    KEY=OFNrZ3FwRHNFZFZ4TTBiZTBLeXBCUG9DOjE3NTU0MDUz
    elif [ $DOMAIN = "t.2p.fm" ] ; then
    KEY=OFNrZ3FwRHNFZFZ4TTBiZTBLeXBCUG9DOjE3NDg5MTQ0
    elif [ $DOMAIN = "pi.2p.fm" ] ; then
    KEY=OFNrZ3FwRHNFZFZ4TTBiZTBLeXBCUG9DOjE3NTQwMzcy
    elif [ $DOMAIN = "g.uk.ms" ] ; then
    KEY=OFNrZ3FwRHNFZFZ4TTBiZTBLeXBCUG9DOjE3NTU0MDcy
fi

DIRECT_URL="http://freedns.afraid.org/dynamic/update.php?$KEY"
echo "Getting current IP"
CHECK_CMD="wget -O - http://ipecho.net/plain"
CURRENTIP=`${CHECK_CMD}`
echo "Found IP to be ${CURRENTIP}"
if [ ! -e "${IPNOW_FILE}" ] ; then
    echo "Creating ${IPNOW_FILE}"
    echo "0.0.0.0" > "${IPNOW_FILE}"
fi
if [ ! -e "${OLDIP_FILE}" ] ; then
    echo "Creating ${OLDIP_FILE}"
    echo "0.0.0.0" > "${OLDIP_FILE}"
fi
OLDIP=`cat ${IPNOW_FILE}`
if [ "${CURRENTIP}" != "${OLDIP}" ] ; then
    echo "Issuing update command"
    UPDATE_COMMAND="/usr/bin/curl -s $DIRECT_URL"
    ${UPDATE_COMMAND}
fi
echo "Saving IP - ${CURRENTIP}"
echo "${CURRENTIP}" > "${IPNOW_FILE}"
echo "${OLDIP} \n" >> "${OLDIP_FILE}"
