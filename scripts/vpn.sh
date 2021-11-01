#!/bin/bash
password=`cat ~/.work_password`
echo "$password" | sudo openconnect --user=alex.bates --passwd-on-stdin --authgroup=VPN-RA ssl.clearcaptions.com