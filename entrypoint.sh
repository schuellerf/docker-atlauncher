#!/bin/bash
cd /tmp
sudo rm -f *

vncserver :1 -geometry 1280x800 -depth 24
