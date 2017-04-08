tunnel=$(ip link show|awk '/(tun|pon)/{print substr($2, 1, 4)}')
if [[ ! -z $tunnel ]]; then
  echo "VPN: %{F#98BC37}Connected%{F-}"
else
  echo "VPN: %{F#F75341}Disconnected!%{F-}"
fi
