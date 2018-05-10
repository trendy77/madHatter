# FREEDNS.AFRAID.ORG 
# DNS UPDATE

## Cron example

** To install into cron, on the console enter: crontab -e **
- Paste in the 2 lines
- save (derrrrr....)


You can check the "/tmp/freedns_trendy_chickenkiller_com.log" file on your system to verify its happening each 5 minutes

````
PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin
0,5,10,15,20,25,30,35,40,45,50,55 * * * * sleep 23 ; curl -s http://sync.afraid.org/u/qRyJ**************sY8I/ >> /tmp/freedns_trendy_chickenkiller_com.log 2>/dev/null


PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin
4,9,14,19,24,29,34,39,44,49,54,59 * * * * sleep 43 ; curl -s http://sync.afraid.org/u/q7Z3t*******wIdYNOQ4/ >> /tmp/freedns_tsmartpad_chickenkiller_com.log 2>/dev/null
````
# OR!
## OR...
### OR, JUST DO THIS...?

#!/bin/bash
usage:
````
./updateDNS.sh  **<site> <ip> **
````
trendy.chickenkiller.com
````
curl http://sync.afraid.org/u/qRyJKTZQsYzHVdKoojXfcY8I/
````
t.2p.fm
````
curl http://sync.afraid.org/u/qRyJKTZQsYzHVdKoojXfcY8I/
````
pi.2p.fm
````
curl http://sync.afraid.org/u/qRyJKTZQsYzHVdKoojXfcY8I/
````
tsmartpad.chickenkiller.com
````
curl http://sync.afraid.org/u/q7ZmNr3twIdY5GOv4bwSNOQ4I/

````
````
#! /bin/bash
DOMAIN=$1
NEWIP=$2

if [[ -z "$1" ]]; then
    echo "Usage: $0 <$DOMAIN> <$IP>"
    echo "WHICH DOMAIN?     \
        1. TRENDY.CHICKENKILLER.COM     \
        2. TSMARTPAD.CHICKENKILLER.COM  \
        3. ORGANISE.BIZ.TM       \
        4. T.2P.FM           \
    5. PI.2P.FM   " RESPONSE
    # NB. YEEAH I REALISE THE FOLLOWING BLOCK OF CODE IS
    # REPETITIVE, NOT 'BEST PRACTICE,' HOWEVER I'M LAZY...
    # AND CAN'T BE ARSED TO SAY "ok Google, how do I word based
    # grep search based loop of variables in BASH..."
    #     *first world problems :P
    if [[ $RESPONSE = '1' ]]; then
        $DOMAIN=trendy.chickenkiller.com
    fi
    if [[ $RESPONSE = '2']]; then
        $DOMAIN=tsmartpad.chickenkiller.com
    fi
    if [[ $RESPONSE = '3' ]]; then
        $DOMAIN=organise.biz.tm
    fi
    if [[ $RESPONSE = '4' ]]; then
        $DOMAIN=t.2p.fm
    fi
    if [[ $RESPONSE = '5' ]]; then
        $DOMAIN=pi.2p.fm
    fi
$COMMAND = "curl http://*********USER:*******PASS@freedns.afraid.org/nic/update?hostname=$DOMAIN]&myip=$NEWIP'
tee $COMMAND
# tee work there...? who knows lol
function getIp {
       RESPONSE= 'curl https://freedns.afraid.org/api/?action=getdyndns&v=2&sha=a1fe437b5d17d22ac3983ac820a52e6841cbcc91&style=xml'
        echo "current IP is $RESPONSE"
        return $RESPONSE
}
````
## DESCRIPTION
## For Amazon EC2 Instances
## Use curl to update a dynamic dns entry for http://afraid.org
## based on http://forums.gentoo.org/viewtopic-t-468368.html
## INSTRUCTIONS
## FIRST, change DIRECT_URL (below) based on http://freedns.afraid.org/dynamic/
## THEN, it doesn't hurt to do the following (change permissions)
## chmod 500 /etc/cron.d/afraid.aws.sh
## sudo chown root.root /etc/cron.d/afraid.aws.sh
## NEXT, move this file to /etc/cron.d,
## FINALLY, add the following line to /etc/crontab
## */2 * * * * root /etc/cron.d/afraid.aws.sh >/dev/null
OLDIP_FILE="/tmp/ip.tmpfile"
## this is from within an instance, just returns instance public IP
## See http://docs.amazonwebservices.com/AWSEC2/latest/UserGuide/using-instance-addressing.html#concepts-instance-addressing for details
CHECK_CMD="GET http://169.254.169.254/latest/meta-data/public-ipv4"
## Find this at http://freedns.afraid.org/dynamic/
DIRECT_URL="http://freedns.afraid.org/dynamic/update.php?***SUMTHINSUMTHIN**=="
UPDATE_COMMAND="/usr/bin/curl -s $DIRECT_URL"
echo "Getting current IP"
CURRENTIP=`${CHECK_CMD}`
echo "Found ${CURRENTIP}"
        if [ ! -e "${OLDIP_FILE}" ] ; then
        echo "Creating ${OLDIP_FILE}"
        echo "0.0.0.0" > "${OLDIP_FILE}"
        fi
OLDIP=`cat ${OLDIP_FILE}`
        if [ "${CURRENTIP}" != "${OLDIP}" ] ; then
        echo "Issuing update command"
        ${UPDATE_COMMAND}
        fi
echo "Saving IP"
echo "${CURRENTIP}" > "${OLDIP_FILE}"
````
