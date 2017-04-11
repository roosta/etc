tunnel=$(ip link show|awk '/(tun|pon)/{print substr($2, 1, 4)}')
if [[ ! -z $tunnel ]]; then
  echo "%{F#98BC37}VPN%{F-}"
else
  echo "%{F#F75341}No VPN!%{F-}"
fi
