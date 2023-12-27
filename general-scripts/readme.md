# General scripts
This is a collection of generic scripts that _should_ work across distrbutions. Haven't tested it though. 

## List of scripts

## toggle-vpn.sh
Used to toggle a VPN connection using networkmanager (gnome), since there is no easy UI toggle for wireguard connections. 
The script doesn't care which type of VPN connection you have. The only important parts are that:
* your VPN connection has "VPN" in the connection ID
* you only have ONE connection ID matching that condition
In case you have multiple VPNs, you can adjust the matching criteria in the script or e.g. use an input variable to select the connection to match. 
I didn't do that as I have one VPN connection and wanted it as easy as possible. 
