#!/bin/bash
cd /tmp
sudo rm -f *

echo $VNCPASS | vncpasswd -f > /root/vncpass

vncserver :1 -geometry 1280x800 -depth 24
