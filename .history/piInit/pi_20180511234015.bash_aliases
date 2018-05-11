# PI VERSION
# apt s/cuts

alias up='apt-get update -y && apt-get full-upgrade -y && apt autoremove -y && apt clean'
alias in='apt-get install -y'
#
alias sup='sudo service --status-all'
alias sc='screen'
alias resh='sudo service ssh restart'
alias cd..='cd ..'
alias pi='ssh -i /home/t/Documents/theNeu/kaliHub root@10.0.77.203'
alias tc='ssh -i /home/t/Documents/theNeu/kaliHub root@10.0.77.117'
alias gogit='/home/root/Documents/blackHattery/kalit00ls/gitQG.sh nt'

alias cln='cd /home/t/Documents/cl0nemast3r && python Cl0neMast3r.py'

alias 2td='cd /home/t/Documents'
alias 2rd='cd /root/Documents'


alias revSSH='gcloud compute ssh --zone us-west1-a tunnel -f -N -p 22 -D localhost:5000 && ssh -N -L 5000:127.0.0.1:22 -i ~/.ssh/google_compute_engine ubuntu@streisand1.us-east4-a.dc11-ebe6f'
alias sshKhub='ssh -p 50001 root@t.2p.fm'
alias sshPi='ssh -p 50001 root@pi.2p.fm'
