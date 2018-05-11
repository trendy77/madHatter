# spectreAliases
## v2.2

# apt s/cuts
alias up='apt-get update -y && apt-get --allow-unauthenticated upgrade -y && apt autoremove -y && apt clean'
alias in='apt-get install -y'

# info/stats
alias sup='service --status-all'
alias resh='sudo service ssh restart'
alias ip?='sudo /sbin/ifconfig'
alias pids?='ps ax'

# app s/cuts
alias sc='screen'
alias gogit='/home/root/Documents/blackHattery/kalit00ls/gitQG.sh nt'
alias cln='cd /home/t/Documents/cl0nemast3r && python Cl0neMast3r.py'
alias clnDir='cd /home/t/Documents/cl0nemast3r && ls -a'

# go2 dirs
alias cd..='cd ..'
alias 2td='cd /home/t/Documents && ls -a'
alias 2rd='cd /root/Documents && ls -a'
alias 2drop='cd /root/Dropbox/blackHattery && ls -a'

# ssh connections
alias pi='ssh -i /home/t/Documents/theNeu/kaliHub root@10.0.77.203'
alias tc='ssh -i /home/t/Documents/theNeu/kaliHub root@10.0.77.117'
alias revSSH='gcloud compute ssh --zone us-west1-a tunnel -f -N -p 22 -D localhost:5000 && ssh -N -L 5000:127.0.0.1:22 -i ~/.ssh/google_compute_engine ubuntu@streisand1.us-east4-a.dc11-ebe6f'
alias sshKhub='ssh -p 50001 root@t.2p.fm'
alias sshPi='ssh -p 50001 root@pi.2p.fm'

##### TO DO
### WSL SECTION?
### BACKUP CMD?
