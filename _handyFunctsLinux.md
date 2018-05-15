# Handy Linux Commands
#### Specifically for light-Kali img for KaliPi

set the DNS servers...
````
echo nameserver 8.8.8.8 > /etc/resolv.conf
````
FIND YOUR IP CONFIG INFO USING....
````
sudo /sbin/ifconfig
````
Show Running Processes
````
ps ax
````
HOSTS SAVED IN
````
/etc/hosts
````
ALL YOUR SOURCES FOR DEB PACKAGES ARE STORED IN...
````
/etc/apt/sources.list
````

#### Enable on-screen keyboard @ login screen
<!-- @import "[TOC]" {cmd="toc" depthFrom=1 depthTo=6 orderedList=false} -->
add to:          
_/etc/lightdm/lightdm-gtk-greeter.conf_
````
show-indicators=~language;~a11y;~session;~power
keyboard=florence --focus
````
**Configure VNC Server:**
A bug in xfce4 might prevent a vnc session if an active desktop session already exists, and log the following error in ~/.xsession-errors:
xfce4-session: Another session manager is already running
To fix that, type:
````
wget -O ~/.vnc/xstartup https://raw.githubusercontent.com/Re4son/RPi-Tweaks/master/vncservice/xstartup
mkdir /home/pi/.vnc/
cp ~/.vnc/xstartup /home/pi/.vnc/
chown pi:pi /home/pi/.vnc/
chown pi:pi /home/pi/.vnc/xstartup
````
Set a vnc server password:
````
vncpasswd
sudo -u pi vncpasswd
````
Optional: to install vncserver as a service type:
````
wget -O /lib/systemd/system/vncserver@.service https://raw.githubusercontent.com/Re4son/RPi-Tweaks/master/vncservice/vncserver@.service ````
# To enable and start the service, type:
````systemctl enable vncserver@1 && systemctl start vncserver@1````

````Install Applications:
# Install some additional packages:
apt install aptitude curl cmake build-essential mailutils python-dev python-pip libusb-1.0-0-dev python-numpy htop ftp locate screen kismet pure-ftpd tigervnc-standalone-server tmux default-mysql-server darkstat ntopng mana-toolkit beef-xss resolvconf mitmf dnsmasq hostapd

    apt install kali-linux-full

# If not, install only the metasploit edition:
    apt install metasploit-framework

# Disable autostart of MySQL (we’d rather start it manually when needed):
    systemctl disable mysql

# House keeping items: Update locate db:
updatedb

# Setup OpenVAS:
apt-get install openvas
openvas-setup
mkdir -p /etc/systemd/system/greenbone-security-assistant.service.d/

# allow web access to gsa by creating the file “/etc/systemd/system/greenbone-security-assistant.service.d/local.conf” with this content

[Service]
ExecStart=
ExecStart=/usr/sbin/gsad --foreground --listen=0.0.0.0 --port=9392 --mlisten=127.0.0.1 --mport=9390

# you can change the automatically generated admin password with the following commands:
openvasmd --user=admin --new-password=<new password>
history -c

# The “history -c” command clears the bash history – important after entering a password on the command line.
# add to “/etc/kismet/kismet.conf”:
ncsource=wlan1
logprefix=/home/ftp/pi/kismet


## OTHER APT APPS OF NOTE....

screen ccze byobu screenie iselect apportpo-debconf ttf-ubuntu-font-family update-notifier-common vim wireless-tools python-doc pthon-tk binutils binfmt-support run-one aptitude synaptic xm-core sgml-data libfont-freetype-perl libpango-perl librarian0 rarian-compat sgmi-base libcairo-perl libglib-perl perlsgml w3-recs opensplibxml2-utils dwww menu deborphan apt-xapian-index software-properties-gtk debhelper -y


CCZE

shellcheck - checks shellcode for errors
doublecmd
````
INSTALL NODE / NPM

````
sudo apt-get install build-essential curl git m4 ruby texinfo libbz2-dev libcurl4-openssl-dev libexpat-dev libncurses-dev zlib1g-dev
````
OTHERS
````
gettext-doc autopoint libasprintf-dev libgettextpo-dev binutils-multiarch libtext-template-perl mkchromecast gplaycli

pidgon
 ## Homebrew for Linux open your terminal application and paste in the command: 
```` 
 ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/linuxbrew/go/install)"
 
  Follow the instructions in the terminal to complete the installation process.
Once Linuxbrew is installed, you’ll need add the following 3 lines to your .bashrc or .zshrc file:

  export PATH="$HOME/.linuxbrew/bin:$PATH"
  export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
  export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"


