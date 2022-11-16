### This was very briefly useful, but now not really at all. 
### But i'll keep it around just in case 


#!/bin/bash

password=`cat ~/.work_password`

# openconnect version 
#echo "$password" | sudo openconnect --user=alex.bates --passwd-on-stdin --authgroup=VPN-RA ssl.clearcaptions.com


# anyconnect version
#exe_path="/mnt/c/Program Files (x86)/Cisco/Cisco AnyConnect Secure Mobility Client/vpncli.exe"
exe_path='/mnt/c/Program Files (x86)/Cisco/Cisco AnyConnect Secure Mobility Client/vpncli.exe'
command_string="connect ssl.clearcaptions.com\n1\nalex.bates\n${password}"

if [[ "$1" == "-h" ]] || [[ "$1" == "--help" ]]; then
    echo "vpn.sh -c to connect"
    echo "       -d to disconnect"
    exit
fi


vpn_state=$("${exe_path}" state)

if [[ "$vpn_state" == *"Disconnected"* ]] ;then
    vpn_connected=false
else
    vpn_connected=true
fi

if [[ "$1" == "-d" ]] && [[ $vpn_connected == true ]]; then
    echo "Disconnecting VPN..."
    "${exe_path}" disconnect
elif [ "$1" == "-c" ] && [ $vpn_connected == false ]; then
    echo "Connecting to VPN..."
    echo -e "$command_string" | "${exe_path}" -s
else
    echo "No action taken. VPN Connected: ${vpn_connected}"
fi


