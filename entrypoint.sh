#!/bin/bash
cd /tmp
sudo rm -f *

mkdir -p /root/.vnc

echo $VNCPASS | vncpasswd -f > /root/.vnc/passwd

vncserver :1 -geometry 1280x800 -depth 24
