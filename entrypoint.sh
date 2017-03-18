#!/bin/bash
cd /tmp
sudo rm -f *

mkdir /root/vncpass
echo $VNCPASS | vncpasswd -f > /root/vncpass

vncserver root:1 -geometry 1280x800 -depth 24
