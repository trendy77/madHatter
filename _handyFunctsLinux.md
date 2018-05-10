# Handy Linux Commands
## Specifically for light-Kali img for KaliPi

#### set the DNS servers...
````
echo nameserver 8.8.8.8 > /etc/resolv.conf
````

#### FIND YOUR IP CONFIG INFO USING....
````
sudo /sbin/ifconfig
````
#### Show Running Processes
````
ps ax
````

#### HOSTS SAVED IN
````
/etc/hosts
````

### ALL YOUR SOURCES FOR DEB PACKAGES ARE STORED IN...
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

## If you have a 16GB sd card or larger and want to have kali in all it’s glory, get yourself a coffee and install the full kali suite (Note: 16GB is very tight, better to use 32GB. Run ## df -h to make sure you didn’t forget to extend your file system earlier 😉 ):
apt install kali-linux-full

# The installation might hang during the wvdial setup. It can happen whilst sitting on “setting up wvdial”. Just kill the “wvdialconf” process and follow this guide.
# If not, install only the metasploit edition:
apt install metasploit-framework

# Disable autostart of MySQL (we’d rather start it manually when needed):
systemctl disable mysql

# House keeping items:
# Update locate db:
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

# This makes wlan1 the default capture device and all log files are being written to the ftp directory for easy remote retrieval (skip this if you are not installing the ftp server below).
# Use a kismet compatible USB dongle like the TP-Link TL-WN722N.
# To make thinks more predictable, you might want to assign wlan1 to your dongle permanently, e.g. via adding the following to “/etc/udev/rules.d/70-persistent-net.rules”:
# USB device 0x:0x (ath9k_htc)
SUBSYSTEM=="net", ACTION=="add", DRIVERS=="?*", ATTR{address}=="", ATTR{dev_id}=="0x0", ATTR{type}=="1", KERNEL=="wlan*", NAME="wlan1"
Speed up booting without eth0 by adding to “/etc/dhcp/dhclient.conf”:
timeout 10;



# HELPER CMDs //USEFUL APPS
## APPS

### SCREEN
list all screens
````bash
screen -list
````
Start a new Screen session
````bash
screen
````
Once inside the session, everything will be preserved â€” even if you close the terminal window or shut down your computer.

***The -r argument can be used to reconnect to a running Screen session.***
````bash
screen -r SESSION-NAME-HERE
````

## OTHER APT APPS OF NOTE....

screen ccze byobu screenie iselect apportpo-debconf ttf-ubuntu-font-family update-notifier-common vim wireless-tools python-doc pthon-tk binutils binfmt-support run-one aptitude synaptic xm-core sgml-data libfont-freetype-perl libpango-perl librarian0 rarian-compat sgmi-base libcairo-perl libglib-perl perlsgml w3-recs opensplibxml2-utils dwww menu deborphan apt-xapian-index software-properties-gtk debhelper -y


CCZE

shellcheck - checks shellcode for errors
doublecmd


 gettext-doc autopoint libasprintf-dev libgettextpo-dev binutils-multiarch libtext-template-perl mkchromecast gplaycli
pidgon
FIND YOUR IP CONFIG INFO USING....
sudo /sbin/ifconfig
