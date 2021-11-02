#!/bin/bash
password=`cat ~/.work_password`

# openconnect version 
#echo "$password" | sudo openconnect --user=alex.bates --passwd-on-stdin --authgroup=VPN-RA ssl.clearcaptions.com


# anyconnect version
exe_path="/mnt/c/Program Files (x86)/Cisco/Cisco AnyConnect Secure Mobility Client/vpncli.exe"
command_string="connect ssl.clearcaptions.com\n1\nalex.bates\n${password}"

vpn_state=`"${exe_path}" state`

if [[ "$vpn_state" == *"Disconnected"* ]] ;then
    echo "VPN Not Connected. Connecting now... "
    echo -e $command_string | "${exe_path}" -s
else 
    echo "VPN Connected. Disconnecting now... "
    "${exe_path}" disconnect
fi


