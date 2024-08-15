#!/bin/ash

apk add curl socat nmap net-tools build-base setxkbmap sudo xrandr bash zsh dbus dbus-x11 sudo setup-xorg-base xfce4 xfce4-terminal lightdm dbus-x11
apk add open-vm-tools open-vm-tools-guestinfo open-vm-tools-deploypkg open-vm-tools-gtk
apk add lightdm-gtk-greeter libxcb-dev xf86-video-vmware dmenu
apk add mesa-gl glib feh firefox-esr accountsservice openvpn
apk add docker docker-compose

# add user
adduser dark
mkdir -p /home/dark/wallpaper

# user setup dark
cp ./dark/wallpaper/compass.jpg /home/dark/wallpaper/compass.jpg
cp ./dark/wallpaper/Techno-Geek.png /home/dark/wallpaper/Techno-Geek.png
cp ./dark/.profile /home/dark/.profile
mkdir -p /home/dark/.scripts
cp ./dark/login-script.sh /home/dark/.scripts/login-script.sh
chown -R dark:dark /home/dark

# add dark to sudoers
cat ./dark/sudoers >> /etc/sudoers

# greeter background
echo "background=/home/dark/wallpaper/compass.jpg" >> /etc/lightdm/lightdm-gtk-greeter.conf

# set background image in accountsservice
cp ./dark/dark /var/lib/AccountsService/users
chown root:root /var/lib/AccountsService/users/dark

# add user to docker
addgroup dark docker

# enable copy paste in vmware
chmod g+s /usr/bin/vmware-user-suid-wrapper

# give dark write access to /opt dir
chown dark:dark /opt

# mkdir /opt/docker
mkdir -p /opt/docker
cp ./docker/* /opt/docker/
chown dark:dark /opt/docker


