#!/bin/bash
status=$(nmcli connection show --active | grep "vpn")
length=${#status}
if ((length > 0)); then
  nmcli connection down "home-vpn"
else
  nmcli connection up "home-vpn"
fi
