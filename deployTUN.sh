#!/bin/bash
## ALGO VPN DEPLOYMENT
### FUNCTION LISTING:

# ./deployTUN.sh
#### - SET UP REMOTE INSTANCE

function setupInstance {
    echo "ANSIBLE VPN TUNNEL SETUP"
    echo "UPDATING SYSTEM..."
    sudo apt-get update && sudo apt-get upgrade -y && sudo apt autoremove
    sleep 1
    cd /home/t/Documents
    echo "CLONING REPOSITORY"
    git clone https://github.com/trailofbits/algo.git
    echo "INSTALLING DEPENDENCIES"
    sudo apt-get install build-essential libssl-dev libffi-dev python-dev python-pip python-setuptools python-virtualenv -y
    echo "NOW FOR THE ANSIBLE PLAYBOOK"
    sudo apt-get update -y && sudo apt-get upgrade -y
    sudo apt-get install software-properties-common boto azure apache-libcloud six -y
    sudo apt-add-repository ppa:ansible/ansible
    sudo apt-get install ansible -y
    sudo cp ./keys ./algo/keys
    cd algo
    # echo "RESTARTING BASH TO SET INSTALLATION"
    echo "AND SETTING UP THE VIRTUALENV"
    sudo python -m virtualenv env && source env/bin/activate && python -m pip install -U pip && python -m pip install -r requirements.txt
    #restart bash
    sudo chmod +x ./algo
    # sudo chmod +x ./ansible-playbook
    SERVN=servName
    read -p"And what region? eg. australia-southeast1-a" REGION
    if [[ -z "$REGION" ]]; then
        $REGION=australia-southeast1-b
    fi
    echo "trying the playbook for server $SERVN with region $REGION"
    sudo ansible-playbook deploy.yml -t cloud, ssh_tunneling, dns, adblock,vpn -e 'credentials_file=~/.ssh/dc11-eec.json gce_server_name=$SERVN ssh_public_key=~/.ssh/google_compute_engine zone=australia-southeast1-b'
    # OR ansible-playbook deploy.yml -t gce,ssh_tunneling,vpn,cloud -e 'credentials_file=./algo/dc11.json gce_server_name=$SERVN zone=$REGION'
}
setupInstance
function goClient {
    #### - SET UP (LINUX) CLIENT
    echo "CLIENT SETUP - LINUX"
    if [[ -z "$2" ]]; then
        NAME=dan
        echo "no name choice - default 'DAN' selected"
    fi
    if [[ -z "$1" ]]; then
        echo -p "no IP given... do you know it?" ANS
        IP=$ANS
    fi
    echo "IP of proxy is $IP and username will be $NAME"
    sudo ansible-playbook deploy_client.yml -e 'client_ip=localhost vpn_user=$NAME server_ip=$IP ssh_user=$NAME'
    sudo apt-get install strongswan strongswan-plugin-openssl -y
    sudo cp ./configs/$IP/pki/certs/$NAME.crt /etc/ipsec.d/certs/$NAME.crt
    sudo cp ./configs/$IP/pki/private/$NAME.key /etc/ipsec.d/private/$NAME.key
    sudo cp ./configs/$IP/pki/cacert.pem /etc/ipsec.d/cacerts/cacert.pem
    sudo cat ./configs/$IP/pki/private/$NAME.key >> /etc/ipsec.secrets
    sudo cat ipsec_$NAME.conf >> /etc/ipsec.conf
    # Let your server access your local LAN without going through the VPN.
    # ADD to        /etc/ipsec.conf
    PASS="conn lan-passthrough      /
    leftsubnet=10.0.77.0/24 /
    rightsubnet=10.0.77.0/24 /
    authby=never    /
    type=pass       /
    auto=route"
    sudo $PASS | tee -a /etc/ipsec.conf
    sudo ipsec restart		# pick up config changes
    echo "Client Installation Complete."

}
goClient
#### - CONNECT TO SSH TUNNEL
#### - DISCONNECT FROM SSH TUNNEL
function launchG {
    sudo ipsec up $CONN
    ssh -D 127.0.0.1:1080 -f -q -C -N $NAME@$IP -i configs/$IP/$NAME.ssh.pem
}
#### - CONNECT THROUGH VPN
#### - DISCONNECT FROM VPN

#       ipsec up $connName                 # start the ipsec tunnel
#       ipsec down $connName               # shutdown the ipsec tunnel

# SSH TUNNEL
function finishSetG {
    ssh -D 127.0.0.1:1080 -f -q -C -N ubuntu@streisand1.us-east4-a.dc11-ebe6f -i configs/$IP/$USER.ssh.pem
    echo "Installation Complete."
}

launchG

v
function newTunnel(){
    ##### CREATE AN SSH TUNNEL TO CLOUD INSTANCE....
    gcloud compute instances create --zone us-west1-a tunnel
    # Start SSH tunnel on local port 5000, that connects to a GCE instance on its SSH port 22
    gcloud compute ssh --zone us-west1-a tunnel -- -f -N -p 22 -D localhost:5000
    # THEN
    ssh -N -L 5000:127.0.0.1:22 -i KEYFILE.pem bitnami@SERVER-IP
}

function ipCheck{
    # use one of the following to check your IP location....
    curl https://api.ip2geo.pl/json/
    curl --proxy socks5://localhost:5000 https://api.ip2geo.pl/json/
}

function killIt(){
    #	 ONCE YOU'RE FINISHED WITH IT....
    # clean-up
    gcloud compute instances delete --zone us-west1-a tunnel
}

## PHYSICAL MODEM COMMANDS

#       goMonMode();
####- LAUNCH MONITOR MODE
#       goStdMode()
####- LAUNCH STANDARD (MANAGE?) MODE
#       startNetMgr()
#       stopNetMgr()
####- UP / DOWN CONNECTION
# NETWORKING - PHYSICAL INTERFACE CONTROLS...
WIFIINTERFACE='wlan1'
WIFIMON='wlan1mon'

function goMonMode {
    stopNetMgr
    echo "printing wlan1 info..."
    sudo iw dev
    echo "setting monitor mode."
    sudo ip link set $WIFIINTERFACE down
    sudo iw dev $WIFIINTERFACE interface add $WIFIMON type monitor
    sudo iw $WIFIINTERFACE del
    sudo ifconfig $WIFIMON up
    echo "confirming? - frequency setting to 2.4ghz:"
    sudo iw dev wlan1mon set freq 2437
    sudo iw config $WIFIMON
    sudo

}
function goStdMode {
    echo "killing monitor mode."
    sudo ifconfig $WIFIMON down
    sudo iw $WIFIMON del
    sudo iw $WIFIINTERFACE interface add $WIFIINTERFACE type managed
    sudo ifconfig $WIFIINTERFACE up
    startNetMgr
    echo "should be back in manage mode..."
    sudo iw dev
}
function stopNetMgr {
    sudo systemctl stop NetworkManager
}
function startNetMgr {
    sudo systemctl start NetworkManager
}
function connectWF {
    sudo ifconfig $WIFIINTERFACE up
}
function disconnWF {
    sudo iw dev $WIFIINTERFACE disconnect
    sudo iw $WIFIINTERFACE down
}
