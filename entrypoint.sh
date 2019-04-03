#!/bin/bash

mkdir -p ${HOME}/.vnc

echo $VNCPASS | vncpasswd -f > ${HOME}/.vnc/passwd
chmod 600 ${HOME}/.vnc/passwd


export DISPLAY=:1

vncserver $DISPLAY -geometry 1280x800 -depth 24

IP=$(ip a show scope global|grep -oP "(?<=inet )[0-9.]+")

echo "You can connect to the VNC server e.g. with"
echo "vncviewer ${IP}${DISPLAY}"
echo "Using the password: $VNCPASS"

# has to be copied now - if we have a mountpount from outside
cp -f /home/atlauncher/ATLauncher.jar .

java -jar ATLauncher.jar

